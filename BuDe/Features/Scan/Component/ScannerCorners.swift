//
//  ScannerCorners.swift
//  BuDe
//
//  Created by Davin P on 05/05/26.
//

import SwiftUI

struct ScannerCorners: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let length: CGFloat = 40
        let radius: CGFloat = 20
        
        // top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY + length))
        path.addArc(tangent1End: CGPoint(x: rect.minX, y: rect.minY),
                    tangent2End: CGPoint(x: rect.minX + length, y: rect.minY),
                    radius: radius)
        path.addLine(to: CGPoint(x: rect.minX + length, y: rect.minY))
        
        // top right
        path.move(to: CGPoint(x: rect.maxX - length, y: rect.minY))
        path.addArc(tangent1End: CGPoint(x: rect.maxX, y: rect.minY),
                    tangent2End: CGPoint(x: rect.maxX, y: rect.minY + length),
                    radius: radius)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + length))
        
        // bottom right
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY - length))
        path.addArc(tangent1End: CGPoint(x: rect.maxX, y: rect.maxY),
                    tangent2End: CGPoint(x: rect.maxX - length, y: rect.maxY),
                    radius: radius)
        path.addLine(to: CGPoint(x: rect.maxX - length, y: rect.maxY))
        
        // bottom left
        path.move(to: CGPoint(x: rect.minX + length, y: rect.maxY))
        path.addArc(tangent1End: CGPoint(x: rect.minX, y: rect.maxY),
                    tangent2End: CGPoint(x: rect.minX, y: rect.maxY - length),
                    radius: radius)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - length))
        
        return path
    }
}
