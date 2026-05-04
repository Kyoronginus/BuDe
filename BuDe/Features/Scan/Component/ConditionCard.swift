//
//  ConditionCard.swift
//  BuDe
//
//  Created by Gabriella Angelina Widjaja on 03/05/26.
//

import SwiftUI

struct ConditionCard: View {
    let condition: Potato
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "questionmark.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            Text(condition.action)
                .font(.headline)
                .foregroundStyle(condition.isRecommended ? Color.fontGreen : Color.fontRed)
            
            Text(condition.name)
                .font(.caption)
                .foregroundStyle(condition.isRecommended ? Color.fontGreen : Color.fontRed)
        }
        .padding()
        .background(condition.isRecommended ? Color.glassGreen : Color.glassRed)
        .background(.ultraThinMaterial)
        .cornerRadius(16)
    }
}

#Preview {
    ConditionCard(condition: Potato.data[0])
}
