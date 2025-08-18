//
//  OnboardingView.swift
//  TrackingWater
//
//  Created by Drolllted on 10.08.2025.
//

import SwiftUI
import SwiftData

struct OnboardingView: View {
    @EnvironmentObject var vm: TrackingWaterViewModel
    @Environment(\.modelContext) private var modelContext
    @State private var text: String = "💧 Water is your superpower!"
    @State private var isVisible: Bool = false
    @Binding var showMainView: Bool
    
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
                    OnboardingWeightView(showMainView: $showMainView)
                        .environmentObject(vm)
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
