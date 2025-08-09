//
//  WeeklyChartsView.swift
//  TrackingWater
//
//  Created by Drolllted on 08.08.2025.
//

import SwiftUI
import SwiftData

struct WeeklyChartsView: View {
    @EnvironmentObject var vm: TrackingWaterViewModel
    let data: [DailyWaterData]
    
    private var maxAmount: Double {
        data.map {$0.amount}.max() ?? 1
    }
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(alignment: .bottom, spacing: 16) {
                ForEach(data) { day in
                    VStack(spacing: 8) {
                        Text("\(Int(day.amount))")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.primary)
                        
                        ZStack(alignment: .bottom) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.systemGray5))
                                .frame(width: 24, height: 150)
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(day.amount > vm.countInDay ? Color.red : Color.blue)
                                .frame(width: 24, height: CGFloat(day.amount / maxAmount * 150))
                                .overlay(
                                    VStack {
                                        Spacer()
                                        if day.amount > 0 {
                                            Text("\(Int(day.amount))")
                                                .font(.system(size: 10, weight: .bold))
                                                .foregroundColor(.white)
                                                .padding(.bottom, 4)
                                        }
                                    }
                                )
                        }
                        
                        Text(day.date.formatted(.dateTime.weekday(.abbreviated)))
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            
            Text("Last 7 days")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal)
    }
}
