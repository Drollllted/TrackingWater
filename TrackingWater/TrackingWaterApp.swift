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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
        .modelContainer(for: WaterInTake.self)
    }
}
