//
//  ContentView.swift
//  TrackingWater
//
//  Created by Drolllted on 04.08.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @EnvironmentObject var vm: TrackingWaterViewModel
    @State private var showFirstTapModal = false
    @State private var showSecondTapModal = false
    @State private var selectedAmount: EnumVariables? = .twoHundredhalf
    
    var body: some View {
        NavigationStack {
            VStack {
                DropFigure(progress: vm.todayWater / vm.countInDay , onFirstTap: {
                    vm.addWater(amount: selectedAmount?.amountAdd ?? 250)
                }, onSecondTap: {
                    showSecondTapModal = true
                })
                .frame(height: 350)
                .environmentObject(vm)
            }
            .sheet(isPresented: $showSecondTapModal, content: {
                SecondTapModalView(selectedAmount: $selectedAmount)
                    .presentationDetents([.large])
            })
            
            .navigationTitle("Tracking Water")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        InformationView()
                            .environmentObject(vm)
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
