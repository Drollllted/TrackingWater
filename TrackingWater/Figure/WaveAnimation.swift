//
//  WaveAnimation.swift
//  TrackingWater
//
//  Created by Drolllted on 04.08.2025.
//

import SwiftUI

struct WaveAnimation: Shape {
    
    var progress: CGFloat
    var waveHeight: CGFloat
    var offset: CGFloat
    
    var animationData: CGFloat {
        get{offset}
        set{offset = newValue}
    }
    
    nonisolated func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .zero)
        
        let progressHeight = (1 - progress) * rect.height
        let height = waveHeight * rect.height
        
        for value in stride(from: 0, to: rect.width, by: 2) {
            let x = value
            let sine = sin(Angle(degrees: value + offset).radians)
            let y = progressHeight  + (height * sine)
            
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        
        return path
    }
    
}
