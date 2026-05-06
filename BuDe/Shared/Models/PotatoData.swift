//
//  PotatoData.swift
//  BuDe
//
//  Created by Gabriella Angelina Widjaja on 02/05/26.
//

import SwiftUI

enum PotatoHandlingTips {
    case healthy
    case blackScurf
    case commonScab
    case sprouted
    case greenPotato
    case rot
    
    var handle: PotatoHandlingModel {
        switch self {
        case .healthy, .commonScab, .blackScurf:
            return PotatoHandlingModel(
                texts: ["Avoid direct sun", "Keep cool & dry", "Use breatheable storage"],
                images: [Image("avoid-direct-sun"), Image("keep-cool-&-dry"), Image("use-breatheable-storage")]
            )
        case .sprouted, .greenPotato, .rot:
            return PotatoHandlingModel(
                texts: ["Cut damaged parts", "Use good parts", "Finish immediately"],
                images: [Image("cut-damaged-parts"), Image("use-good-parts"), Image("finish-immediately")]
            )
        }
    }
    
}

extension Potato {
    static let data: [Potato] = [
        Potato(
            name: "Healthy",
            action: "Likely Recommended",
            tips: "No signs of sprouts, mold, or greening detected, indicating the potato is in fresh condition.",
            handle: PotatoHandlingTips.healthy.handle,
            isRecommended: true
        ),
        Potato(
            name: "Black Scurf",
            action: "Likely Recommended",
            tips: "Dark patches on the skin only. Safe to eat when peeled.",
            handle: PotatoHandlingTips.blackScurf.handle,
            isRecommended: true
        ),
        Potato(
            name: "Common Scab",
            action: "Likely Recommended",
            tips: "Rough, scaly skin. Still safe to eat.",
            handle: PotatoHandlingTips.commonScab.handle,
            isRecommended: true
        ),
        Potato(
            name: "Sprouted",
            action: "Not recommended",
            tips: "Sprouted potatoes are dangerous due to high solanine levels.",
            handle: PotatoHandlingTips.sprouted.handle,
            isRecommended: false
        ),
        Potato(
            name: "Green Patches",
            action: "Not recommended",
            tips: "Green areas contain solanine. May be harmful if consume in excess.",
            handle: PotatoHandlingTips.greenPotato.handle,
            isRecommended: false
        ),
        Potato(
            name: "Soft Rotten",
            action: "Not recommended",
            tips: "Soft or rotten potatoes show signs of decay and should be discarded.",
            handle: PotatoHandlingTips.rot.handle,
            isRecommended: false
        )]
}
