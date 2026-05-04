//
//  DetailViewModel.swift
//  BuDe
//
//  Created by Gabriella Angelina Widjaja on 04/05/26.
//
import SwiftUI

enum PotatoCondition {
    case safeToEat
    case notRecommended
    
    var resultText: String {
        switch self {
        case .safeToEat: return "Likely Recommended"
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

import SwiftUI

struct DetailViewModel: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DetailViewModel()
}
