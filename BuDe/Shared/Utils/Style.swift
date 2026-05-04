//
//  Style.swift
//  BuDe
//
//  Created by Gabriella Angelina Widjaja on 04/05/26.
//

import SwiftUI

extension Color {
    static let fontRed: Color = Color(hex: "E9152D")
    static let glassRed: Color = Color(hex: "FFD6DA").opacity(0.6)
    static let fontGreen: Color = Color(hex: "008932")
    static let glassGreen: Color = Color(hex: "E4FFEB").opacity(0.6)
    static let fontDark: Color = Color(hex: "444444")
    static let yellowBackground: Color = Color(hex: "FFCC00")
    static let glassYellow: Color = Color(hex: "FFE5B0")
    static let white: Color = Color(hex: "FFFFFF")
}

extension Font {
    static let title: Font = .custom("Poppins-Bold", size: 20)
    static let subtitle: Font = .custom("Poppins-Semibold", size: 16)
    static let body: Font = .custom("Poppins-Regular", size: 14)
    static let caption: Font = .custom("Poppins-Semibold", size: 12)
    
    static let boundingBoxText: Font = .custom("Poppins-Bold", size: 10)
}
