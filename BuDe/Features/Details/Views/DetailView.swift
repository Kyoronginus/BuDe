//
//  DetailView.swift
//  BuDe
//
//  Created by Tohru Djunaedi Sato on 01/05/26.
//
import SwiftUI

struct DetailView: View {
    let potato: Potato = Potato.data[0]
    
    var body: some View {
        ZStack{
            // warna background ny
            Color(Color(hex: "F1EDE0"))
                .ignoresSafeArea()
            
            VStack{
                // Potato
                Text("Potato")
                    .font(.custom("Poppins-SemiBold", size: 16))
                
                // recommended or not
                Text("Placeholder Placeholder")
                    .font(.custom("Poppins-Bold", size: 25))
                    .foregroundStyle(Color(hex: "E9152D"))
                    
                
                // potato image
                Image("potato-image-1")
                
                // condition list row?
                HStack{
                    RoundedRectangle(cornerRadius: 14)
                        .inset(by: 0)
                        .foregroundColor(Color(hex: "E9152D"))
                    RoundedRectangle(cornerRadius: 14)
                        .inset(by: 0)
                        .foregroundColor(Color.green)
                }
                
                // Handling tips
                HStack{
                    Text("Handling Tips")
                    Spacer()
                }
                
                RoundedRectangle(cornerRadius: 14)
                
                // great job! thingy
                RoundedRectangle(cornerRadius: 14)
                    .padding(30)
                    
                
            }
            .padding(20)
        }
    }
}

#Preview {
    DetailView()
}

extension Color {
  init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
    let rgbValue = UInt32(hex, radix: 16)
    let r = Double((rgbValue! & 0xFF0000) >> 16) / 255
    let g = Double((rgbValue! & 0x00FF00) >> 8) / 255
    let b = Double(rgbValue! & 0x0000FF) / 255
    
    self.init(red: r, green: g, blue: b)
  }
}
