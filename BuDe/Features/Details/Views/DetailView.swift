//
//  DetailView.swift
//  BuDe
//
//  Created by Tohru Djunaedi Sato on 01/05/26.
//
import SwiftUI
import Vision

struct DetailView: View {
    
    var viewModel: DetailViewModel
    @State private var selected = "Condition"
    let options = ["Condition", "Handling Tips"]
    
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
                        .fill(viewModel.overallCondition().resultBoxColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .strokeBorder(viewModel.overallCondition().resultTextColor, lineWidth: 2)
                            
                        )
                        .frame(height: 50)
                        .padding(.horizontal, 50)
                    Text(viewModel.overallCondition().resultText)
                        .font(.custom("Poppins-Bold", size: 18))
                        .foregroundStyle(viewModel.overallCondition().resultTextColor)
                }
                
                
                if let processedImage = viewModel.processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
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
                    //  .scaleEffect(1.2)
                } else {
                    viewModel.overallCondition().resultImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                }
                
                
                Picker("Select a type", selection: $selected) {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                            .tag(option)
                    }
                }
                .pickerStyle(.segmented)
                .zIndex(1)
                .padding(.bottom, 10)
                .onAppear(){
                    UISegmentedControl.appearance().backgroundColor = .lightGray
                    
                    // Warna slider yang bergerak (putih)
                    UISegmentedControl.appearance().selectedSegmentTintColor = .white
                    
                    // Warna teks
                    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
                    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
                }
                
                if selected == "Condition"{
                    // condition list row
                    VStack{
                        HStack{
                            Text("Condition")
                                .font(.subtitle)
                                .foregroundStyle(Color.fontDark)
                            Spacer()
                        }
                        
                        VStack {
                            VStack(spacing: 8){
                                if !viewModel.notRecommendedPotatoes().isEmpty {
                                    conditionListCard(type: .issue, potatoes: viewModel.notRecommendedPotatoes())
                                }
                                if !viewModel.recommendedPotatoes().isEmpty {
                                    conditionListCard(type: .good, potatoes: viewModel.recommendedPotatoes())
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 8)
                    }
                }
                
                else if selected == "Handling Tips" {
                    // handling tips row
                    
                    VStack{
                        HStack{
                            Text("Handling Tips")
                                .font(.subtitle)
                                .foregroundStyle(Color.fontDark)
                            Spacer()
                        }
                        
                        HandlingGroup(card: viewModel.getHandlingCard())
                    }
                    
                }
            }
            .padding(20)
            .presentationDragIndicator(.visible)
        }
    }
    
    
}

//#Preview {
//    DetailView(viewModel: DetailViewModel(detectedPotatoes: [
//        Potato(
//            name: "Healthy",
//            action: "Likely Recommended",
//            tips: "No signs of sprouts, mold, or greening detected, indicating the potato is in ",
//            handle: PotatoHandlingTips.allNotRecommended
//                .handle,
//            isRecommended: true
//        ),
//        Potato(
//            name: "Healthy",
//            action: "Likely Recommended",
//            tips: "No signs of sprouts, mold, or greening detected, indicating the potato is in ",
//            handle: PotatoHandlingTips.allNotRecommended
//                .handle,
//            isRecommended: true
//        ),
//        Potato(
//            name: "Healthy",
//            action: "Likely Recommended",
//            tips: "No signs of sprouts, mold, or greening detected, indicating the potato is in ",
//            handle: PotatoHandlingTips.allNotRecommended
//                .handle,
//            isRecommended: true
//        ),
//    ], isRecommended: true))
//}

