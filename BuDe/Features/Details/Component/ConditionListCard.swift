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
    }
}


#Preview {
    ZStack{
        Color.backgroundColor
            .ignoresSafeArea()
        VStack {
            conditionListCard(type: .issue, potatoes: Potato.data)
        }
    }

}
