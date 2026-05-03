//
//  CameraManager.swift
//  BuDe
//
//  Created by Tohru Djunaedi Sato on 01/05/26.
//

import Foundation
import AVFoundation // access camera
import CoreVideo // for cvpixelbuffer format image
import Combine

class CameraManager: NSObject, ObservableObject {
    
    let camSession = AVCaptureSession()
    private let videoOutput = AVCaptureVideoDataOutput() // output gambar
    var onFrameCaptured: ((CVPixelBuffer) -> Void)?
    override init() {
        super.init()
        setupCamera()
    }
    
    private func setupCamera(){
        camSession.beginConfiguration()
        
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
        else {
            print("cam not found!")
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
        } catch{
            print("failed: \(error.localizedDescription)")
        }
        
        camSession.commitConfiguration()
    }
    
    func start(){
        DispatchQueue.global(qos: .background).async{
            self.camSession.startRunning()
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

