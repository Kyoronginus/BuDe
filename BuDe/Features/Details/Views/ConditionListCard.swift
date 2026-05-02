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
    
    var gradientStartColor: Color {
        switch self {
        case .issue: return Color(hex: "FFE0E3")
        case .good: return Color(hex: "34C759")
        }
    }
    
    var gradientEndColor: Color {
        switch self {
        case .issue: return Color(hex: "FF9CA6")
        case .good: return Color(hex: "008932")
        }
    }
    
    var textColor: Color {
        switch self {
        case .issue: return Color.red
        case .good: return Color.green
        }
    }
}
struct conditionListCard: View {
    let type: CardType
    let opacityValue: Double = 0.55
    let issuesCount: Int = 0
    let goodAreasCount: Int = 0
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 14)
                .fill(
                    LinearGradient(colors: [ type.gradientStartColor, type.gradientEndColor],
                                   startPoint: .top,
                                   endPoint: .bottom)
                )
                .opacity(opacityValue)
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
