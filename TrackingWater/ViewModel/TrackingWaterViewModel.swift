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
    
    
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchCurrentWaterDay()
    }
    
    func addWater(amount: Double) {
        let inTakes = WaterInTake(amount: amount)
        modelContext.insert(inTakes)
        todayWater += amount
        try? modelContext.save()
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
