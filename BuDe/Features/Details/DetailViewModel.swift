//
//  DetailViewModel.swift
//  BuDe
//
//  Created by Tohru Djunaedi Sato on 01/05/26.
//
import SwiftUI
import Vision
enum PotatoCondition {
    case safeToEat
    case notRecommended
    
    var resultText: String {
        switch self {
        case .safeToEat: return "Likely Recommended"
        case .notRecommended: return "Not Recommended"
        }
    }
    
    var resultTextColor: Color {
        switch self {
        case .safeToEat: return Color.fontGreen
        case .notRecommended: return Color.fontRed
        }
    }
    
    var resultBoxColor: Color {
        switch self {
        case .safeToEat: return Color.glassGreen
        case .notRecommended: return Color.glassRed
        }
    }
    
    var resultImage: Image {
        switch self {
        case .safeToEat: return Image("potato-image-safeToEat")
        case .notRecommended: return Image("potato-image-notRecommended")
        }
    }
}

@Observable
class DetailViewModel {
    var detectedPotatoes: [Potato]
    var isRecommended: Bool
    var pixelBuffer: CVPixelBuffer?
    var processedImage: Image?
    
    
    init(detectedPotatoes: [Potato], isRecommended: Bool, pixelBuffer: CVPixelBuffer? = nil) {
        self.detectedPotatoes = detectedPotatoes
        self.isRecommended = isRecommended
        self.pixelBuffer = pixelBuffer
        
        generateMaskImage()
    }
    
    var recommendedPotatoes: [Potato] {
        self.detectedPotatoes.filter({ $0.isRecommended })
    }
    
    var notRecommendedPotatoes: [Potato] {
        self.detectedPotatoes.filter({ !$0.isRecommended })
    }
    
    var overallCondition: PotatoCondition {
        return isRecommended ? .safeToEat : .notRecommended
    }
    
    var handlingTips: PotatoHandlingModel {
        return detectedPotatoes.first!.handle
    }
    
    func generateMask() -> CVPixelBuffer? {
        guard let pixelBuffer = self.pixelBuffer else {
            return nil
        }
        
        let request = VNGenerateForegroundInstanceMaskRequest ()
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        
        do {
            try handler.perform([(request)])
            guard let result = request.results?.first else {
                // no foreground
                return nil
            }
            let maskedBuffer = try result.generateMaskedImage(
                ofInstances: result.allInstances,
                from: handler,
                croppedToInstancesExtent: true
            )
            return maskedBuffer
        } catch {
            // gagal membuat mask
            return nil
        }
    }
    
    func generateMaskImage() {
        guard let maskPixelBuffer = generateMask() else { return }
        let ciImage = CIImage(cvPixelBuffer: maskPixelBuffer)
        let context = CIContext()
        if let cgImage = context.createCGImage(ciImage, from: ciImage.extent) {
            self.processedImage = Image(uiImage: UIImage(cgImage: cgImage, scale: 1.0, orientation: .right))
        }
    }
}
