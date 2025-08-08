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
                    vm.addWater(amount: 250)
                }, onSecondTap: {
                    showSecondTapModal = true
                })
                .frame(height: 350)
                .environmentObject(vm)
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
        .onAppear {
            vm.deleteEveryDay()
        }
    }
}
