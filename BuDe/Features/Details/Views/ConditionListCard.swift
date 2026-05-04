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
    let opacityValue: Double = 1.0
    let issuesCount: Int = 0
    let goodAreasCount: Int = 0
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 14)
                .fill(type.cardColor)
                .opacity(opacityValue)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .strokeBorder(type.borderColor, lineWidth: 2)
                )
                
            VStack{
                HStack {
                    
                    Text( type == .issue ? "❌ \(issuesCount) Issues Found" : "✅ \(goodAreasCount) Good Areas")
                        .font(.custom("Nunito-Bold", size: 14))
                        .foregroundStyle(type.textColor)
                    
                    // todo: looping buat nunjukin issues nya
                    
                }
            }
        }
    }
}

#Preview {
    VStack {
        conditionListCard(type: .issue)
        conditionListCard(type: .good)
    }
}
