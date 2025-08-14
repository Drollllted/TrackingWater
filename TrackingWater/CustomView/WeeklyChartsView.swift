//
//  WeeklyChartsView.swift
//  TrackingWater
//
//  Created by Drolllted on 08.08.2025.
//

import SwiftUI
import SwiftData
import Charts

struct WeeklyChartsView: View {
    @EnvironmentObject var vm: TrackingWaterViewModel
    var data: [DailyWaterData]
    
    var body: some View {
        VStack {
            Chart {
                RuleMark(y: .value("drink Water", vm.countInDay))
                    .lineStyle(StrokeStyle(dash: [5, 5]))
                    .foregroundStyle(Color.gray.opacity(0.5))
                
                ForEach(data) { item in
                    BarMark(x: .value("days", item.date), y: .value("drink Water", item.amount))
                        .foregroundStyle(.blue)
                        .annotation(position: .top, alignment: .top) {
                            if item.amount != 0{
                                Text(String(Int(item.amount)))
                                    .font(.callout)
                            }
                        }
                }
            }
            .padding()
            .frame(width: 300, height: 300)
            .aspectRatio(contentMode: .fit)
            
            Spacer()
        }
    }
}
