//
//  HextoRgb.swift
//  BuDe
//
//  Created by Tohru Djunaedi Sato on 02/05/26.
//
import SwiftUI

// ngubah hex ke RGB
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
