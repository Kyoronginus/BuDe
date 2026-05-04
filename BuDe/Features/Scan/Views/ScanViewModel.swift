//
//  ScanViewModel.swift
//  BuDe
//
//  Created by Gabriella Angelina Widjaja on 04/05/26.
//

import Combine
import Foundation
import Vision

@Observable class ScanViewModel {
    var cameraManager = CameraManager()
    var results: Potato?
    
    private let mlModel = MLService()
    
    init() {
        setupMLConnection()
    }
    
    private func setupMLConnection() {
        cameraManager.onFrameCaptured = { [weak self] pixelBuffer in
            self?.mlModel.predict(pixelBuffer: pixelBuffer) { observations in
                if let topResult = observations.first?.labels.first?.identifier {
                    DispatchQueue.main.async {
                        self?.results = Potato.data.first(where: { potato in
                            return potato.name == topResult
                        })
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.results = nil
                    }
                }
            }
        }
    }
}
