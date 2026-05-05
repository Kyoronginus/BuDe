//
//  MLService.swift
//  BuDe
//
//  Created by Tohru Djunaedi Sato on 01/05/26.
//

import CoreML
import Vision
import CoreVideo

class MLService {
    
    private var detectionRequest: VNCoreMLRequest?
    init() { setupModel()}
    
    private func setupModel() {
        do {
            let model_config = MLModelConfiguration()
            let core_model = try yolov11n_kentangv6(configuration: model_config).model
            let vision_model = try VNCoreMLModel(for: core_model)
            let request = VNCoreMLRequest(model: vision_model)
            request.imageCropAndScaleOption = .scaleFill
            request.regionOfInterest = CGRect(x: 0.18, y: 0.35, width: 0.64, height: 0.30)
            self.detectionRequest = request
            
        } catch {
            print("fail to load the ML model: \(error.localizedDescription)")
        }
    }
    
    func predict(pixelBuffer: CVPixelBuffer, completion: @escaping ([VNRecognizedObjectObservation]) -> Void) {
        
        guard let request = detectionRequest else {
            completion([])
            return
        }
        
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .right, options: [:])
        
        do {
            try handler.perform([request])
            
            guard let results = request.results as? [VNRecognizedObjectObservation] else {
                completion([])
                return
            }
            completion(results)
        } catch {
            print("failed to predict: \(error.localizedDescription)")
            completion([])
        }
    }
}
