//
//  ConditionCard.swift
//  BuDe
//
//  Created by Gabriella Angelina Widjaja on 02/05/26.
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
                .foregroundStyle(condition.isRecommended ? .green : .red)
            
            Text(condition.name)
                .font(.caption)
                .foregroundStyle(condition.isRecommended ? .green : .red)
        }
        .padding()
        .background(condition.isRecommended ? .green.opacity(0.1) : .red.opacity(0.15))
        .background(.ultraThinMaterial)
        .cornerRadius(16)
    }
}

#Preview {
    ConditionCard(condition: Potato.data[0])
}
