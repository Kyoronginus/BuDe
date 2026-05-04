//
//  ScanViewModel.swift
//  BuDe
//
//  Created by Gabriella Angelina Widjaja on 04/05/26.
//

import SwiftUI
import Combine
import Foundation

class ScanViewModel: ObservableObject {
    @Published var cameraManager = CameraManager()
    @Published var results: Potato?
    
    private var cancellables: Set<AnyCancellable> = []
    
}
