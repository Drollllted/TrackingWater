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
    
    init() {
        do {
            container = try ModelContainer(for: WaterInTake.self)
        } catch {
            fatalError("Failed to create ModelContainer for WaterInTake: \(error.localizedDescription)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(vm: TrackingWaterViewModel(modelContext: ModelContext(container)))
                .preferredColorScheme(.dark)
        }
    }
}
