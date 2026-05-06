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
    static let yellowBackground: Color = Color(hex: "FFC107")
    static let glassYellow: Color = Color(hex: "FFE5B0")
    static let white: Color = Color(hex: "FFFFFF")
    static let backgroundColor: Color = Color(hex: "F1EDE0")
    static let borderWhite: Color = Color(hex: "F0F0F0")
    static let backgroundRed: Color = Color(hex: "FFE1E5")
    static let backgroundGreen: Color = Color(hex: "DEFFE1")
}

extension Font {
    static let title: Font = .custom("Poppins-Bold", size: 20)
    static let subtitle: Font = .custom("Poppins-Bold", size: 16)
    static let cardText: Font = .custom("DMSans-VariableFont", size: 17)
    static let conditionCard: Font = .custom("DMSans-VariableFont", size: 13)
    static let readMoreDetailText: Font = .custom("DMSans-VariableFont", size: 11)
}
