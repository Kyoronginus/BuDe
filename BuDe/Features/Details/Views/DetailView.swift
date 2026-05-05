//
//  DetailView.swift
//  BuDe
//
//  Created by Tohru Djunaedi Sato on 01/05/26.
//
import SwiftUI

struct DetailView: View {
//    let potato: Potato
//    let potatoCondition: PotatoCondition
//    let handlingTips: PotatoHandlingModel
        
    var viewModel: DetailViewModel
    
    
    var body: some View {
        ZStack{
            // warna background ny
            Color(hex: "F1EDE0")
                .ignoresSafeArea()
            
            VStack{
                // Potato
                Text("Potato")
                    .font(.custom("Poppins-SemiBold", size: 16))
                
                // recommended or not
                ZStack(){
                    RoundedRectangle(cornerRadius: 100)
                        .fill(viewModel.overallCondition.resultBoxColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .strokeBorder(viewModel.overallCondition.resultTextColor, lineWidth: 2)
                            
                        )
                        .frame(height: 50)
                        .padding(.horizontal, 50)
                    Text(viewModel.overallCondition.resultText)
                        .font(.custom("Poppins-Bold", size: 18))
                        .foregroundStyle(viewModel.overallCondition.resultTextColor)
                }
                
                
                // potato image
                viewModel.overallCondition.resultImage
                
                
                // condition list row
                HStack{
                    Text("Condition")
                        .font(Font.subtitle)
                    Spacer()
                }
                    
                VStack {
                    HStack(spacing: 20){
                        if !viewModel.notRecommendedPotatoes.isEmpty {
                            conditionListCard(type: .issue, potatoes: viewModel.notRecommendedPotatoes)
                        }
                        if !viewModel.recommendedPotatoes.isEmpty {
                            conditionListCard(type: .good, potatoes: viewModel.recommendedPotatoes)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 8)

                HStack{
                    Text("Handling Tips")
                        .font(Font.subtitle)
                    Spacer()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .strokeBorder(Color(hex: "F0F0F0"), lineWidth: 2)
                        )
                    HStack() {
                        ForEach(0..<viewModel.handlingTips.texts.count, id: \.self) { index in
                            VStack(){
                                viewModel.handlingTips.images[index]
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Text(viewModel.handlingTips.texts[index])
                                    .font(.custom("Poppins-SemiBold", size: 9))
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(12)
                }
                .frame(height: 130)

                // great job! thingy
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color(hex: "FFE5B0"))
                        .opacity(1.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .strokeBorder(Color(hex: "FFC107"), lineWidth: 2)
                        )
                        .frame(height: 70)
                    HStack{
                        Image("happyPotato")
                            .resizable()
                            .padding(10)
                            .frame(width: 70, height:70)
                        Text("Great job! You're taking good care of your potato!")
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundStyle(Color(hex: "444444"))
                        Spacer()
                    }
                }.padding(.top, 16)
            }
            .padding(20)
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(detectedPotatoes: [
        Potato(
            name: "Healthy",
            action: "Likely Recommended",
            tips: "No signs of sprouts, mold, or greening detected, indicating the potato is in fresh condition",
            handle: PotatoHandlingTips.healthy.handle,
            isRecommended: true
        )
    ], isRecommended: true))
}

