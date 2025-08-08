//
//  TrackingWaterViewModel.swift
//  TrackingWater
//
//  Created by Drolllted on 05.08.2025.
//

import SwiftData
import SwiftUI

final class TrackingWaterViewModel: ObservableObject {
    @Published var todayWater: Double = 0
    @Published var selectedDay = Date()
    @Published var countInDay: Double = 3000
    
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchCurrentWaterDay()
    }
    
    func addWater(amount: Double) {
        let inTakes = WaterInTake(amount: amount)
        print("1")
        modelContext.insert(inTakes)
        print("2")
        todayWater += amount
        print("3")
        try? modelContext.save()
        print("4")
        print(todayWater)
        
        if todayWater == countInDay {
            print("У тебя получилось! Молодец")
        }
    }
    
    func fetchCurrentWaterDay() {
        let calendar = Calendar.current
        let todayCurrent = calendar.startOfDay(for: Date())
        let predicate = #Predicate<WaterInTake> { $0.date >= todayCurrent }
        
        do {
            let inTakes = try modelContext.fetch(FetchDescriptor(predicate: predicate))
            todayWater = inTakes.reduce(0) { $0 + $1.amount }
        } catch {
            print("Error fetching today intake:", error.localizedDescription)
        }
        
    func weeklyData() -> [DailyWaterData] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        var result: [DailyWaterData] = []
        
        for dayOffset in (-6)...0 {
            guard let date = calendar.date(byAdding: .day, value: dayOffset, to: today) else { continue }
            
            let startDate = calendar.startOfDay(for: date)
            let endDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
            
            let predicate = #Predicate<WaterInTake> {
                $0.date >= startDate && $0.date < endDate
            }
            
            do {
                let intakes = try modelContext.fetch(FetchDescriptor(predicate: predicate))
                let total = intakes.reduce(0) { $0 + $1.amount }
                result.append(DailyWaterData(date: date, amount: total))
            } catch {
                print("Error fetching data for \(date):", error)
            }
        }
            
            
        return result.sorted {$0.date < $1.date}
        }
        
    }
}
