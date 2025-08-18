//
//  InformationView.swift
//  TrackingWater
//
//  Created by Drolllted on 04.08.2025.
//

import SwiftUI
import SwiftData

struct InformationView: View {
    
    @Environment(\.modelContext) var context
    @EnvironmentObject var vm: TrackingWaterViewModel
    
    var body: some View {
        NavigationStack{
            VStack {
                WeeklyChartsView(data: vm.weeklyData)
                    .environmentObject(vm)
                    .frame(height: 200)
                    .padding(.horizontal)
            }
            .navigationTitle("Information")
            .onAppear{
                vm.updateWeeklyData()
            }
        }
    }
}
