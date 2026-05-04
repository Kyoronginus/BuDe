//
//  ScanView.swift
//  BuDe
//
//  Created by Gabriella Angelina Widjaja on 03/05/26.
//

import SwiftUI
import AVFoundation

struct ScanView: View {
    @State var viewModel = ScanViewModel()
    
    var body: some View {
        ZStack {
            CameraPreview(session: viewModel.cameraManager.camSession)
                .ignoresSafeArea()
            
            VStack {
                if let detectedPotato = viewModel.results {
                    ConditionCard(condition: detectedPotato)
                        .padding(.top, 60)
                        .transition(.move(edge: .top).combined(with: .opacity))
                    
                    Spacer()
                    
                    Text("Read more the result")
                        .font(.system(size: 14))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.yellow)
                        .cornerRadius(16)
                }
                
                HStack {
                    Image(systemName: "questionmark.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(.trailing)
                    
                    Text("Scan the whole area for accurate results")
                        .font(.system(size: 14))

                }.padding(.vertical, 8)
                    .padding(.horizontal, 75)
                .background(.ultraThinMaterial)
            }
        }
        .onAppear {
            viewModel.cameraManager.start()
        }
        .onDisappear {
            viewModel.cameraManager.stop()
        }
    }
}

#Preview {
    ScanView()
}
