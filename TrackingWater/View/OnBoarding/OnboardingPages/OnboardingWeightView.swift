//
//  OnboardingTabView.swift
//  TrackingWater
//
//  Created by Drolllted on 16.08.2025.
//

import SwiftUI
import SwiftData

struct OnboardingWeightView: View {
    @State private var weightValue: Int = 70
    @State private var isVisible: Bool = false
    @State private var weightUnit: EnumWeight = .kg
    @EnvironmentObject var vm: TrackingWaterViewModel
    @Binding var showMainView: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("Write your weight, please")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Text("1. Choose the easiest way for you to record your weight")
                    .padding()
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Picker("Weight Unit", selection: $weightUnit) {
                    ForEach(EnumWeight.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                            .tag(unit)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Text("2. Choose your Weight")
                    .padding()
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                if weightUnit == .kg {
                    Picker("Weight in kg", selection: $weightValue) {
                        ForEach(20..<200) { weight in
                            Text("\(weight) kg")
                                .tag(weight)
                        }
                    }
                    .pickerStyle(.wheel)
                } else {
                    Picker("Weight in lb", selection: $weightValue) {
                        ForEach(40..<440) { weight in
                            Text("\(weight) lb")
                                .tag(weight)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                
                Text("Your weight: \(weightValue) \(weightUnit.rawValue)")
                    .foregroundStyle(.white)
                    .font(.footnote)
                    .padding()
                    .frame(alignment: .center)
                    .offset(y: -20)
                
                Spacer()
            }
            
            Button {
                let calculatedNorm = calculateWaterNorm()
                vm.updateCountInDay(amountInDay: calculatedNorm)
                OnboardingManager.completeOnboarding()
                showMainView = false
            } label: {
                Text("Get Started")
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .fill()
                            .foregroundStyle(.blue)
                            .frame(width: 300, height: 50, alignment: .center)
                    }
                    .offset(y: -10)
            }
            .padding()
        }
        .opacity(isVisible ? 1.0 : 0.0)
        .animation(.easeIn(duration: 1.5), value: isVisible)
        .onAppear {
            isVisible = true
        }
    }
    
    private func calculateWaterNorm() -> Double {
        let weightInKg = weightUnit == .kg ?
            Double(weightValue) :
            Double(weightValue) * 0.453592
        return weightInKg * 30
    }
    
}
