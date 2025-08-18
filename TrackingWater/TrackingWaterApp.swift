//
//  TrackingWaterApp.swift
//  TrackingWater
//
//  Created by Drolllted on 04.08.2025.
//

import SwiftUI
import SwiftData

@main
struct TrackingWaterApp: App {
    let container: ModelContainer
    @State private var showOnboarding: Bool
    @StateObject private var vm: TrackingWaterViewModel
    
    init() {
        do {
            container = try ModelContainer(for: WaterInTake.self)
            let context = container.mainContext
            _vm = StateObject(wrappedValue: TrackingWaterViewModel(modelContext: context))
            showOnboarding = !OnboardingManager.onboardingFlag
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            
            if vm.showOnboarding || !OnboardingManager.onboardingFlag {
                OnboardingView(showMainView: $vm.showOnboarding)
                    .environmentObject(vm)
                    .preferredColorScheme(.dark)
            } else {
                ContentView()
                    .environmentObject(vm)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
