//
//  DetailView.swift
//  BuDe
//
//  Created by Tohru Djunaedi Sato on 01/05/26.
//
import SwiftUI
import Vision

struct DetailView: View {
    //    let potato: Potato
    //    let potatoCondition: PotatoCondition
    //    let handlingTips: PotatoHandlingModel
    
    var viewModel: DetailViewModel
    
    
    var body: some View {
        ZStack{
            // warna background ny
            Color.backgroundColor
                .ignoresSafeArea()
            
            VStack{
                // Potato
                Text("Potato")
                    .font(.subtitle)
                    .foregroundStyle(Color.fontDark)
                
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
                
                
                if let processedImage = viewModel.processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .overlay(
                            // gambar bounding box
                            GeometryReader { geometry in
                                ForEach(viewModel.boundingBoxes, id: \.uuid) { observation in
                                    let boundingBox = observation.boundingBox
                                    
                                    let boxWidth = boundingBox.width * geometry.size.width
                                    let boxHeight = boundingBox.height * geometry.size.height
                                    
                                    let centerX = boundingBox.midX * geometry.size.width
                                    let centerY = (1.0 - boundingBox.midY) * geometry.size.height
                                    
                                    let label = observation.labels.first?.identifier ?? ""
                                    let boxColor: Color = (label == "Healthy" || label == "Common Scab" || label == "Black Scurf") ? .green : .red
                                    
                                    ZStack {
                                        Rectangle()
                                            .stroke(boxColor, lineWidth: 2)
                                        
                                        Rectangle()
                                            .fill(boxColor.opacity(0.15))
                                    }
                                    .frame(width: boxWidth, height: boxHeight)
                                    
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        let isGreen = (label == "Healthy" || label == "Common Scab" || label == "Black Scurf")
                                        viewModel.switchCondition(isGreen: isGreen)
                                    }
                                    .position(x: centerX, y: centerY)
                                }
                            }
                        )
                        .scaleEffect(1.2)
                } else {
                    viewModel.overallCondition.resultImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                }
                
                // condition list row
                HStack{
                    Text("Condition")
                        .font(.subtitle)
                        .foregroundStyle(Color.fontDark)
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
                        .font(.subtitle)
                        .foregroundStyle(Color.fontDark)
                    Spacer()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .strokeBorder(Color.borderWhite, lineWidth: 2)
                        )
                    HStack() {
                        ForEach(0..<viewModel.handlingTips.texts.count, id: \.self) { index in
                            VStack(){
                                viewModel.handlingTips.images[index]
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Text(viewModel.handlingTips.texts[index])
                                    .font(.handlingText)
                                    .foregroundStyle(Color.fontDark)
                                    .multilineTextAlignment(.center)
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
                        .fill(Color.glassYellow)
                        .opacity(1.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .strokeBorder(Color.yellowBackground, lineWidth: 2)
                        )
                        .frame(height: 70)
                    HStack{
                        Image("happyPotato")
                            .resizable()
                            .padding(10)
                            .frame(width: 70, height:70)
                        Text(viewModel.overallCondition.courageMessage)
                            .font(.body)
                            .foregroundStyle(Color.fontDark)
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

