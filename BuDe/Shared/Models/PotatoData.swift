//
//  PotatoData.swift
//  BuDe
//
//  Created by Gabriella Angelina Widjaja on 02/05/26.
//

import SwiftUI

enum PotatoHandlingTips {
    case allRecommended
    case allNotRecommended
    case mixed
    
    var handle: PotatoHandlingModel {
        switch self {
        case .allRecommended:
            return PotatoHandlingModel(
                texts: ["Avoid direct sun", "Keep cool & dry", "Use breatheable storage"],
                imageNames: ["avoid-direct-sun", "keep-cool-&-dry", "use-breatheable-storage"]
            )
        case .allNotRecommended:

            return PotatoHandlingModel(
                texts: ["Throw away entirely","Separate from fresh potatoes"],
                imageNames: ["throw-away-entirely", "separate-from-fresh-potatoes"]
                )
        case .mixed:
            return PotatoHandlingModel(
                texts: ["Cut damaged parts", "Use good parts", "Finish immediately"],
                imageNames: ["cut-damaged-parts", "use-good-parts", "finish-immediately"]
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
            handle: PotatoHandlingTips.allRecommended.handle,
            isRecommended: true
        ),
        Potato(
            name: "Black Scurf",
            action: "Likely Recommended",
            tips: "Dark patches on the skin only. Safe to eat when peeled.",
            handle: PotatoHandlingTips.allRecommended.handle,
            isRecommended: true
        ),
        Potato(
            name: "Common Scab",
            action: "Likely Recommended",
            tips: "Rough, scaly skin. Still safe to eat.",
            handle: PotatoHandlingTips.allRecommended.handle,
            isRecommended: true
        ),
        Potato(
            name: "Sprouted",
            action: "Not recommended",
            tips: "Sprouted potatoes are dangerous due to high solanine levels.",
            handle: PotatoHandlingTips.allNotRecommended.handle,
            isRecommended: false
        ),
        Potato(
            name: "Green Patches",
            action: "Not recommended",
            tips: "Green areas contain solanine. May be harmful if consume in excess.",
            handle: PotatoHandlingTips.allNotRecommended.handle,
            isRecommended: false
        ),
        Potato(
            name: "Soft Rotten",
            action: "Not recommended",
            tips: "Soft or rotten potatoes show signs of decay and should be discarded.",
            handle: PotatoHandlingTips.allNotRecommended.handle,
            isRecommended: false
        )]
}
