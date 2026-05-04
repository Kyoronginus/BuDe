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
    
    var isRecommended: Bool {
        title == "Safe to Eat"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "questionmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            Text(title)
                .font(Font.title)
                .foregroundStyle(isRecommended ? Color.fontGreen : Color.fontRed)
            
            VStack(alignment: .leading) {
                ForEach(condition) { potato in
                    HStack {
                        Circle()
                            .fill(potato.isRecommended ? Color.fontGreen : Color.fontRed)
                            .frame(width: 10, height: 10)
                            .padding(4)
                        
                        Text(potato.name)
                            .font(Font.caption)
                            .foregroundStyle(Color.fontDark)
                    }
                }
            }
            
            Spacer()
            
            Button(action: {
                isDetailShown.toggle()
            }) {
                Text("Read More Details")
                    .font(Font.caption)
                    .foregroundStyle(Color.fontDark)
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(.white.opacity(0.9))
                    .cornerRadius(20)
            }
        }
        .padding()
        .background(isRecommended ? Color.glassGreen : Color.glassRed)
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .sheet(isPresented: $isDetailShown){
            DetailView(viewModel: DetailViewModel(detectedPotatoes: condition,
                       isRecommended : self.isRecommended))
        }
    }
}

#Preview {
    ConditionCard(title: "Safe to Eat", condition: Potato.data)
}
