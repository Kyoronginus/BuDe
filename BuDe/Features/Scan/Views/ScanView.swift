import SwiftUI
import AVFoundation
import Vision

struct ScanView: View {
    @State private var viewModel = ScanViewModel()
    
    var body: some View {
        ZStack {
            CameraPreview(session: viewModel.cameraManager.camSession)
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                ForEach(viewModel.detectedBoxes, id: \.uuid) { observation in
                    let label = observation.labels.first?.identifier ?? ""
                    let boundingBox = observation.boundingBox
                    
                    let boxWidth = boundingBox.width * geometry.size.width
                    let boxHeight = boundingBox.height * geometry.size.height
                    
                    let centerX = boundingBox.midX * geometry.size.width
                    let centerY = (1.0 - boundingBox.midY) * geometry.size.height
                    
                    let boxColor: Color = (label == "Healthy" || label == "Common Scab" || label == "Black Scurf") ? .green : .red
                    
                    ZStack {
                        Rectangle()
                            .stroke(boxColor, lineWidth: 2)
                        
                        Rectangle()
                            .fill(boxColor.opacity(0.15))
                    
                        VStack {
                            Text(label)
                                .font(Font.boundingBoxText)
                                .bold()
                                .foregroundColor(.white)
                                .padding(4)
                                .background(boxColor)
                                .cornerRadius(4)
                            Spacer()
                        }
                        .offset(y: -24)
                    }
                    .frame(width: boxWidth, height: boxHeight)
                    .position(x: centerX, y: centerY)
                    .animation(.easeInOut(duration: 0.2), value: centerX)
                }
            }
            .ignoresSafeArea()
            
            VStack {
                if !viewModel.results.isEmpty {
                    HStack(alignment: .top, spacing: 12) {
        
                        let safePotatoes = viewModel.results.filter { $0.action == "Likely Recommended" }
                        if !safePotatoes.isEmpty {
                            ConditionCard(title: "Likely Recommended", condition: safePotatoes)
                        }
                        
                        let riskyPotatoes = viewModel.results.filter { $0.action == "Not recommended" }
                        if !riskyPotatoes.isEmpty {
                            ConditionCard(title: "Not Recommended", condition: riskyPotatoes)
                        }
                    }
                    .padding(.top, 40)
                    .padding(.horizontal, 16)
                    
                    Spacer()
                } else {
                    Spacer()
                }
            }
                
            HStack(spacing: 12) {
                    Image("thinkPotato")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.yellow)
                    
                    Text("Scan the whole area for accurate results.")
                        .font(.body)
                        .foregroundColor(.white)
                }
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }.onAppear {
            viewModel.cameraManager.start()
        }
        .onDisappear {
            viewModel.cameraManager.stop()
        }
        .alert(item: $viewModel.cameraManager.currentError) { error in
            Alert(
                title: Text("Attention!"),
                message: Text(error.errorDesc ?? "Unknown Error 404."),
                dismissButton: .default(Text("OK")) {
                    if let settingsURL = URL(string: UIApplication.openSettingsURLString){
                        UIApplication.shared.open(settingsURL)
                    }
                }
            )
        }
    }
}
