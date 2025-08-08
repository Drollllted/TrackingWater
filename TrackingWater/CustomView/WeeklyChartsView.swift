//
//  WeeklyChartsView.swift
//  TrackingWater
//
//  Created by Drolllted on 08.08.2025.
//

import SwiftUI
import SwiftData

struct WeeklyChartsView: View {
    let data: [DailyWaterData]
    
    private var maxAmount: Double {
        data.map {$0.amount}.max() ?? 1
    }
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            ForEach(data) { day in
                VStack{
                    RoundedRectangle(cornerRadius: 6)
                        .fill(day.amount > 0 ? Color.red : Color.blue)
                        .frame(width: 30, height: CGFloat(day.amount / maxAmount * 150))
                    
                    // Подпись дня недели
                    Text(day.date.formatted(.dateTime.weekday(.abbreviated)))
                        .font(.caption)
                    
                    // Подпись количества
                    Text("\(Int(day.amount))")
                        .font(.caption2)
                }
            }
        }
        
        Text("Last 7 days")
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}
