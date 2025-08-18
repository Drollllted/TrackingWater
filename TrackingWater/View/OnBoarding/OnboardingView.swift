//
//  OnboardingView.swift
//  TrackingWater
//
//  Created by Drolllted on 10.08.2025.
//

import SwiftUI
import SwiftData

struct OnboardingView: View {
    
    @State private var text: String = "💧 Water is your superpower!"
    @State private var isVisible: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 60) {
                Text(text)
                    .bold()
                    .font(.largeTitle)
                    .padding()
                    .opacity(isVisible ? 1.0 : 0.0)
                    .animation(.easeIn(duration: 1.5), value: isVisible)
                
                Spacer()
                
                NavigationLink {
                    OnboardingWeightView()
                        .environmentObject(TrackingWaterViewModel(modelContext: try! ModelContainer(for: WaterInTake.self).mainContext))
                } label: {
                    Text("Get Started")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill()
                                .foregroundStyle(.blue)
                                .frame(width: 300, height: 50)
                        }
                        .padding()
                }
                
                
                
            }
            .padding()
        }
        .onAppear {
            isVisible = true
        }
    }
}

#Preview {
    OnboardingView()
        .preferredColorScheme(.dark)
}
