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
    case greenSkin
    case rotten
    
    var handle: PotatoHandlingModel {
        switch self {
        case .healthy, .commonScab, .blackScurf:
            return PotatoHandlingModel(
                texts: ["Avoid direct sun", "Keep cool & dry", "Use breatheable storage"],
                images: [Image("avoid-direct-sun"), Image("keep-cool-&-dry"), Image("use-breatheable-storage")]
            )
        case .sprouted, .greenSkin, .rotten:
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
            action: "Safe to Eat",
            handle: PotatoHandlingTips.healthy.handle,
            isRecommended: true
        ),
        Potato(
            name: "Black Scurf",
            action: "Safe to Eat",
            handle: PotatoHandlingTips.blackScurf.handle,
            isRecommended: true
        ),
        Potato(
            name: "Common Scab",
            action: "Safe to Eat",
            handle: PotatoHandlingTips.commonScab.handle,
            isRecommended: true
        ),
        Potato(
            name: "Sprouted",
            action: "Not recommended",
            handle: PotatoHandlingTips.sprouted.handle,
            isRecommended: false
        ),
        Potato(
            name: "Green Skin",
            action: "Not recommended",
            handle: PotatoHandlingTips.greenSkin.handle,
            isRecommended: false
        ),
        Potato(
            name: "Rotten",
            action: "Not recommended",
            handle: PotatoHandlingTips.rotten.handle,
            isRecommended: false
        )]
}
