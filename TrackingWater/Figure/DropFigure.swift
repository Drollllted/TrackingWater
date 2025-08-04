//
//  DropFigure.swift
//  TrackingWater
//
//  Created by Drolllted on 04.08.2025.
//

import SwiftUI

struct DropFigure: View {
    
   @State var startAnimation: CGFloat = 0
    
    var body: some View {
        
        GeometryReader { geometry in
            let size = geometry.size
            ZStack{
                Image(systemName: "drop.fill")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
                    .foregroundStyle(.white)
                    .scaleEffect(x: 1.1, y: 1)
                    .offset(y: -1)
                
                WaveAnimation(progress: 0.5, waveHeight: 0.1, offset: startAnimation)
                    .fill(Color.blue)
                    .mask {
                        Image(systemName: "drop.fill")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .padding(20)
                    }
            }
            .frame(width: size.width, height: size.height, alignment: .center)
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    startAnimation = size.width
                }
            }
        }
        .frame(height: 350)
    }
    
}

#Preview{
    DropFigure()
        .preferredColorScheme(.dark)
}
