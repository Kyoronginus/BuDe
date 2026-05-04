//
//  ScanView.swift
//  BuDe
//
//  Created by Tohru Djunaedi Sato on 01/05/26.
//

import SwiftUI

struct ScanView: View {
    @State var isPopupShown: Bool = false
    
    var body: some View {
        Button("Ngetes Modal cuy") {
            isPopupShown.toggle()
        }
        .sheet(isPresented: $isPopupShown) {
            DetailView()
        }
    }
}


#Preview {
    ScanView()
}
