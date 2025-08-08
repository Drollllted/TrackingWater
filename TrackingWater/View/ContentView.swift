//
//  ContentView.swift
//  TrackingWater
//
//  Created by Drolllted on 04.08.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @StateObject var vm: TrackingWaterViewModel
    @State private var showFirstTapModal = false
    @State private var showSecondTapModal = false
    
    var body: some View {
        NavigationStack {
            VStack {
                DropFigure(progress: vm.todayWater / vm.countInDay , onFirstTap: {
                    showFirstTapModal = true
                }, onSecondTap: {
                    showSecondTapModal = true
                })
                .frame(height: 350)
            }
            .navigationTitle("Tracking Water")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        InformationView()
                    } label: {
                        InformationButton()
                    }

                }
            }
        }
        .onAppear {
            vm.fetchCurrentWaterDay()
        }
    }
}

#Preview {
    
    //Mock данные
    
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: WaterInTake.self, configurations: config)
    
    let mockViewModel = TrackingWaterViewModel(modelContext: container.mainContext)
    mockViewModel.todayWater = 1200 // Пример мок-данных
    
    return ContentView(vm: mockViewModel)
        .preferredColorScheme(.dark)
}
