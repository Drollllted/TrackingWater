//
//  DropFigure.swift
//  TrackingWater
//
//  Created by Drolllted on 04.08.2025.
//

import SwiftUI

struct DropFigure: View {
    var body: some View {
        
        GeometryReader { geometry in
            ZStack{
                Image(systemName: "drop.fill")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview{
    DropFigure()
        .preferredColorScheme(.dark)
}
