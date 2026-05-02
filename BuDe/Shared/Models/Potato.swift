//
//  Potato.swift
//  BuDe
//
//  Created by Gabriella Angelina Widjaja on 02/05/26.
//

import SwiftUI

struct Potato: Identifiable {
    let id = UUID()
    let name: String
    let action: String
    let handle: [String]
    let storage: [String]
    let isRecommended: Bool
}
