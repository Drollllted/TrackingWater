//
//  DropFigure.swift
//  TrackingWater
//
//  Created by Drolllted on 04.08.2025.
//

import SwiftUI

struct DropFigure: View {
    // @EnvironmentObject var vm: TrackingWaterViewModel
    @State private var offset: CGFloat = 0
    var progress: Double
    var onFirstTap: () -> Void
    var onSecondTap: () -> Void
    @State private var onTapCount: Int = 0
    
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
                
                WaveAnimation(progress: progress, waveHeight: 0.03, offset: offset)
                    .fill(Color.blue)
                    .mask {
                        Image(systemName: "drop.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: min(size.width, size.height) * 0.9)
                
                VStack {
                    Text("\(Int(progress * 100))%")
                        .bold()
                    Text("\(String(format: "%.1f", progress * 2000))/2000 ml")
                        .font(.subheadline)
                }
            }
            .frame(width: size.width, height: size.height, alignment: .center)
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    offset = size.width - 100
                }
            }
            .onTapGesture {
                onTapCount += 1
                
                if onTapCount == 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        if onTapCount == 1 {
                            onFirstTap()
                            print("one tap")
                        }
                        onTapCount = 0
                    }
                } else if onTapCount == 2 {
                    //onSecondTap()
                    print("two tap")
                    onTapCount = 0
                }
            }
        }
    }
    
}
