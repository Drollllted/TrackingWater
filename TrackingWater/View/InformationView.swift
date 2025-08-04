//
//  InformationView.swift
//  TrackingWater
//
//  Created by Drolllted on 04.08.2025.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        NavigationStack{
            VStack {
                
            }
            .navigationTitle("Information")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gear")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.white)
                    }

                }
            }
        }
    }
}

#Preview {
    InformationView()
        .preferredColorScheme(.dark)
}
