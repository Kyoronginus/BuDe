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
        case .issue: return Color.backgroundRed
        case .good: return Color.backgroundGreen
        }
    }
    
    var borderColor: Color {
        switch self{
        case .issue: return Color.glassRed
        case .good : return Color.glassGreen
        }
    }
    
    var textColor: Color {
        switch self {
        case .issue: return Color.fontRed
        case .good: return Color.fontGreen
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
                    
                    HStack {
                        Circle()
                            .fill(type.textColor)
                            .frame(width: 8, height: 8)
                        
                        Text("\(potato.name)")
                            .font(.cardText)
                            .foregroundStyle(type.textColor)
                    }
                    Text(potato.tips)
                        .font(.body)
                        .foregroundStyle(Color.fontDark)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
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
    }
}
