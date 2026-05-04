//
//  ConditionListCard.swift
//  BuDe
//
//  Created by Tohru Djunaedi Sato on 02/05/26.
//

import SwiftUI
enum CardType {
    case issue
    case good
    
    var cardColor: Color {
        switch self {
        case .issue: return Color(hex: "FFE1E5")
        case .good: return Color(hex: "DEFFE1")
        }
    }
    
    var borderColor: Color {
        switch self{
        case .issue: return Color(hex: "FFD6DA")
        case .good : return Color(hex: "B5F9BA")
        }
    }
    
    var textColor: Color {
        switch self {
        case .issue: return Color(hex: "E9152D")
        case .good: return Color(hex: "008932")
        }
    }
}

struct conditionListCard: View {
    let type: CardType
    let potatoes: [Potato]
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 14)
                .fill(type.cardColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .strokeBorder(type.borderColor, lineWidth: 2)
                )
            VStack{
                VStack (alignment: .leading) {
                    // todo: looping buat nunjukin issues nya
                    ForEach(potatoes) { potato in
                        VStack (alignment: .leading){
                            Text("• \(potato.name)")
                                .font(Font.subtitle)
                                .foregroundStyle(type.textColor)
                            Text(potato.tips)
                        }
                        
                    }
                    
                }
                
            }
        }
    }
}

#Preview {
    VStack {
        conditionListCard(type: .issue, potatoes: [
            Potato(
                name: "Healthy",
                action: "Safe to Eat",
                tips: "No signs of sprouts, mold, or greening detected, indicating the potato is in fresh condition",
                handle: PotatoHandlingTips.healthy.handle,
                isRecommended: true
            ),
            Potato(
                name: "Black Scurf",
                action: "Safe to Eat",
                tips: "Black scurf appears as dark patches on the skin but does not affect the inside, so the potato is still safe to eat when peeled",
                handle: PotatoHandlingTips.blackScurf.handle,
                isRecommended: true
            ),
            Potato(
                name: "Common Scab",
                action: "Safe to Eat",
                tips: "Common scab causes rough, scaly spots on the skin but is harmless and the potato remains safe to eat",
                handle: PotatoHandlingTips.commonScab.handle,
                isRecommended: true
            ),
            Potato(
                name: "Sprouted",
                action: "Not recommended",
                tips: "Soft or rotten potatoes show signs of decay and should be discarded",
                handle: PotatoHandlingTips.sprouted.handle,
                isRecommended: false
            ),
            Potato(
                name: "Green Potato",
                action: "Not recommended",
                tips: "Green areas on potatoes indicate the presence of solanine, which can be harmful if consumed in excess",
                handle: PotatoHandlingTips.greenSkin.handle,
                isRecommended: false
            ),
            Potato(
                name: "Rot",
                action: "Not recommended",
                tips: "Soft or rotten potatoes show signs of decay and should be discarded",
                handle: PotatoHandlingTips.rotten.handle,
                isRecommended: false
            )
        ])
//        conditionListCard(type: .good)
    }
}
