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
        ForEach(potatoes) { potato in
            VStack (alignment: .leading, spacing: 4){
                
                Text("\(potato.name)")
                    .font(.custom("DMSans-9ptRegular_Regular", size: 16))
                    .bold()
                    .foregroundStyle(type.textColor)
                Text(potato.tips)
                    .font(.custom("DMSans-9ptRegular_SemiBold", size: 16))
                    .foregroundStyle(Color.fontDark)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color.borderWhite, lineWidth: 2)
        )
        //ngecek font bawaan
        .onAppear {
            for family in UIFont.familyNames.sorted() {
                let names = UIFont.fontNames(forFamilyName: family)
                print("Family: \(family) Font names: \(names)")
            }
        }
    }
}

#Preview {
    ZStack{
        Color.backgroundColor
            .ignoresSafeArea()
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
            conditionListCard(type: .good, potatoes: [
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
                )
            ])
        }
    }

}
