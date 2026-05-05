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
        VStack (alignment: .leading, spacing: 12) {
            ForEach(potatoes) { potato in
                VStack (alignment: .leading, spacing: 4){
                    Text("• \(potato.name)")
                        .font(Font.subtitle)
                        .foregroundStyle(type.textColor)
                    
                    Text(potato.tips)
                        .font(Font.body)
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(type.cardColor)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .strokeBorder(type.borderColor, lineWidth: 2)
        )
    }
}

#Preview {
    VStack {
        conditionListCard(type: .issue, potatoes: [
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
                handle: PotatoHandlingTips.greenPotato.handle,
                isRecommended: false
            ),
            Potato(
                name: "Rot",
                action: "Not recommended",
                tips: "Soft or rotten potatoes show signs of decay and should be discarded",
                handle: PotatoHandlingTips.rot.handle,
                isRecommended: false
            )
        ])
//        conditionListCard(type: .good, potatoes: <#[Potato]#>)
    }
}
