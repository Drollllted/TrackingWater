//
//  WaterInTake.swift
//  TrackingWater
//
//  Created by Drolllted on 05.08.2025.
//

import SwiftUI
import SwiftData

@Model
final class WaterInTake {
    var date: Date
    var amount: Double
    
    init(date: Date = .now, amount: Double) {
        self.date = date
        self.amount = amount
    }
}
