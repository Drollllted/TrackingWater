//
//  DailyWaterData.swift
//  TrackingWater
//
//  Created by Drolllted on 05.08.2025.
//

import Foundation

struct DailyWaterData: Identifiable {
    let id = UUID()
    let date: Date
    let amount: Double
}
