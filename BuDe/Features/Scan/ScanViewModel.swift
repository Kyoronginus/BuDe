import SwiftUI
import Vision

@Observable class ScanViewModel {
    var cameraManager = CameraManager()
    
    var results: [Potato] = []
    var detectedBoxes: [VNRecognizedObjectObservation] = []
    
    private let mlModel = MLService()
    private var lastPredictionTime = Date()
    
    @ObservationIgnored var lastPixelBuffer: CVPixelBuffer? 
    
    init() {
        setupMLConnection()
    }
    
    private func setupMLConnection() {
        cameraManager.onFrameCaptured = { [weak self] pixelBuffer in
            guard let self = self else { return }
            
            let now = Date()
            guard now.timeIntervalSince(self.lastPredictionTime) >= 1.0 else {return}
            
            self.lastPixelBuffer = pixelBuffer
            
            self.mlModel.predict(pixelBuffer: pixelBuffer) { observations in
                DispatchQueue.main.async {
                    let filteredObservations = observations.filter { $0.confidence > 0.55 }
                    self.detectedBoxes = filteredObservations
                    
                    let detectedNames = filteredObservations.compactMap {
                        $0.labels.first?.identifier
                    }
                    
                    let uniqueNames = Array(Set(detectedNames))
                    
                    DispatchQueue.main.async {
                        self.results = Potato.data.filter {
                            uniqueNames.contains($0.name)
                        }
                    }
                    
                    self.lastPredictionTime = now
                }
            }
        }
    }
}
