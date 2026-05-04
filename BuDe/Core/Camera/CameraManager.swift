//
//  CameraManager.swift
//  BuDe
//
//  Created by Tohru Djunaedi Sato on 01/05/26.
//

import AVFoundation // access camera
import CoreVideo // for cvpixelbuffer format image
import Combine

// Enumaration
enum CameraManagerErrorHandling: Error, Identifiable{
    var id: String{UUID().uuidString}
    case cameraNotAvailable
    case inputFailed(String)
    case permissionDenied
    
    var errorDesc: String?{
        switch self{
        case .cameraNotAvailable:
            return "Camera is not available in this device!"
        case .inputFailed(let message):
            return "Fail to access the camera \(message)"
        case .permissionDenied:
            return "Camera permission denied. Please allow the camera in Settings."
        }
        
    }
}

@Observable class CameraManager: NSObject {
    
    let camSession = AVCaptureSession()
    private let videoOutput = AVCaptureVideoDataOutput() // output gambar
    var onFrameCaptured: ((CVPixelBuffer) -> Void)?
    
    var currentError: CameraManagerErrorHandling?
    override init() {
        super.init()
        setupCamera()
    }
    
    private func setupCamera() {
        camSession.beginConfiguration()
        
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
        else {
            DispatchQueue.main.async{
                self.currentError = .cameraNotAvailable
            }
            return
        }
        
        do{
            let videoInput = try AVCaptureDeviceInput(device: videoDevice)
            if camSession.canAddInput(videoInput){
                camSession.addInput(videoInput)
            }
            
            videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
            if camSession.canAddOutput(videoOutput){
                camSession.addOutput(videoOutput)
            }
            
        } catch let error as NSError {
            DispatchQueue.main.async{
                self.currentError = .inputFailed(error.localizedDescription)
            }
        }
        
        camSession.commitConfiguration()
    }
    
    private func runSession(){
        DispatchQueue.global(qos: .background).async{
            self.camSession.startRunning()
        }
    }
    
    func start(){
        switch AVCaptureDevice.authorizationStatus(for: .video){
            case .authorized:
                runSession()
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video){ granted in
                    if granted{self.runSession()}
                    else {
                        DispatchQueue.main.async{
                            self.currentError = .permissionDenied
                        }
                    }
                }
        default:
            DispatchQueue.main.async{
                self.currentError = .permissionDenied
            }
        }
    }
        
    func stop(){
        self.camSession.stopRunning()
    }
    
}

// intinya output dari gambar akan dikirim ke scanviewmodel dengan onframecaptured
extension CameraManager: AVCaptureVideoDataOutputSampleBufferDelegate{
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection){
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {return}
        self.onFrameCaptured?(pixelBuffer)
    }
}

