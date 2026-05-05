//
//  ConditionCard.swift
//  BuDe
//
//  Created by Gabriella Angelina Widjaja on 03/05/26.
//

import SwiftUI

struct ConditionCard: View {
    let title: String
    let condition: [Potato]
    @State var isDetailShown: Bool = false
    
    var onToggleSheet: (Bool) -> Void
    
    var isRecommended: Bool {
        title == "Likely Recommended"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(isRecommended ? "happyPotato" : "sadPotato")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .leading)
            
            Text(title)
                .font(.subtitle)
                .foregroundStyle(isRecommended ? Color.fontGreen : Color.fontRed)
            
            VStack(alignment: .leading, spacing: 2) {
                ForEach(condition) { potato in
                    HStack {
                        Circle()
                            .fill(potato.isRecommended ? Color.fontGreen : Color.fontRed)
                            .frame(width: 8, height: 8)
                        
                        Text(potato.name)
                            .font(.caption)
                            .foregroundStyle(Color.fontDark)
                    }
                }
            }
            
            Button(action: {
                isDetailShown.toggle()
                onToggleSheet(isDetailShown)
            }) {
                Text("Read More Details")
                    .font(.caption)
                    .foregroundStyle(Color.fontDark)
                    .frame(alignment: .trailing)
                    .padding(8)
                    .background(.white.opacity(0.9))
                    .cornerRadius(20)
            }.padding(.top, 4)
        }
        .padding()
        .background(isRecommended ? Color.glassGreen : Color.glassRed)
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .sheet(isPresented: $isDetailShown, onDismiss: {
            onToggleSheet(false)
        }) {
            DetailView(viewModel: DetailViewModel(detectedPotatoes: condition, isRecommended: self.isRecommended))
        }
    }
}
//
//#Preview {
//    ConditionCard(title: "Likely Recommended", condition: Potato.data)
//}
