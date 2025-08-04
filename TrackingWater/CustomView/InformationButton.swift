//
//  InformationButton.swift
//  TrackingWater
//
//  Created by Drolllted on 04.08.2025.
//

import SwiftUI

struct InformationButton: View {
    var body: some View{
        Image(systemName: "info.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
            .foregroundStyle(.white)
    }
}

#Preview {
    InformationButton()
}
