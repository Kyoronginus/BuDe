//
//  HandlingTipsCard.swift
//  BuDe
//
//  Created by Gabriella Angelina Widjaja on 06/05/26.
//

import SwiftUI

struct HandlingTips: Identifiable {
    let id = UUID()
    let imageName: String
    let label: String
    let isRecommended: Bool
}
     
enum HandlingTipsGroup {
    case recommended
    case notRecommended
    case mixed
}

struct HandlingCard {
    let items: [HandlingTips]
    
    var groupType: HandlingTipsGroup {
        let hasRecommended = items.contains { $0.isRecommended }
        let hasNotRecommended = items.contains { !$0.isRecommended }
        
        switch (hasRecommended, hasNotRecommended) {
        case (true, false):
            return .recommended
        case (false, true):
            return .notRecommended
        default:
            return .mixed
        }
    }
}

struct HandlingTipsCard: View {
    let item: HandlingTips
    
    var body: some View {
        HStack(spacing: 14) {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)
            
            Text(item.label)
                .font(.custom("DMSans-9ptRegular_SemiBold", size: 16))
                .foregroundStyle(Color.fontDark)
            
            Spacer()
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

struct HandlingGroup: View {

    let card: HandlingCard
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(card.items) { item in
                HandlingTipsCard(item: item)
            }
        }
    }
}

