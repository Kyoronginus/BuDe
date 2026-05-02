//
//  conditionListRow.swift
//  BuDe
//
//  Created by Tohru Djunaedi Sato on 02/05/26.
//
import SwiftUI

struct conditionListRow: View {
    let issuesCount: Int = 0
    let goodAreasCount: Int = 0
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 14)
                    .inset(by: 0)
//                    .foregroundColor(Color(hex: "E9152D"))
                    .fill(
                        LinearGradient(colors: [Color(hex :"FFE0E3"), Color(hex: "FF9CA6")],
                            startPoint: .top,
                            endPoint: .bottom)
                    )
                    .opacity(0.55)
                VStack{
                    HStack {
                        Text("❌ \(issuesCount) Issues Found")
                        // looping
                    }
                }
            }
            RoundedRectangle(cornerRadius: 14)
                .foregroundColor(Color.green)
        }
    }
}

#Preview {
    conditionListRow()
}
