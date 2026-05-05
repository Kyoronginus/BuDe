//
//  DetailViewModel.swift
//  BuDe
//
//  Created by Tohru Djunaedi Sato on 01/05/26.
//
import SwiftUI

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
    
    
    init(detectedPotatoes: [Potato], isRecommended: Bool) {
        self.detectedPotatoes = detectedPotatoes
        self.isRecommended = isRecommended
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
}
