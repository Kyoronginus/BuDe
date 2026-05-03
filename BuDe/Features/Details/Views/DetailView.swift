//
//  DetailView.swift
//  BuDe
//
//  Created by Tohru Djunaedi Sato on 01/05/26.
//
import SwiftUI

enum PotatoCondition {
    case safeToEat
    case notRecommended
    
    var resultText: String {
        switch self {
        case .safeToEat: return "Safe to Eat"
        case .notRecommended: return "Not Recommended"
        }
    }
    
    var resultTextColor: Color {
        switch self {
        case .safeToEat: return Color(hex: "00A86B")
        case .notRecommended: return Color(hex: "E9152D")
        }
    }
    
    var resultImage: Image {
        switch self {
        case .safeToEat: return Image("potato-image-safeToEat")
        case .notRecommended: return Image("potato-image-notRecommended")
        }
    }
    
}

struct DetailView: View {
    let potato: Potato = Potato.data[0]
    let potatoCondition: PotatoCondition = Potato.data[0].isRecommended ? .safeToEat : .notRecommended
    let handlingTips: PotatoHandlingModel = Potato.data[0].handle
    
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
                Text(potatoCondition.resultText)
                    .font(.custom("Poppins-Bold", size: 25))
                    .foregroundStyle(potatoCondition.resultTextColor)
                
                // potato image
                potatoCondition.resultImage
                
                // condition list row?
                HStack(spacing: 20){
                    conditionListCard(type: .issue)
                    conditionListCard(type: .good)
                }

                
                // Handling tips
                HStack{
                    Text("Handling Tips")
                    Spacer()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color(hex: "FFFFFF"))
                        .opacity(1.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .strokeBorder(Color(hex: "F0F0F0"), lineWidth: 2)
                        )
                    HStack() {
                        ForEach(0..<handlingTips.texts.count, id: \.self) { index in
                            VStack(){
                                handlingTips.images[index]
                                Text(handlingTips.texts[index])
                            }

                        }
                    }
                    .padding(12)
                    
                }

                // great job! thingy
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .foregroundColor(.white)
                    HStack{
                        Image("maskot")
                            .padding(10)
                        Text("Great job! You're taking good care of your potato!")
                        Spacer()
                    }
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    DetailView()
}

