//
//  FirstTapModalView.swift
//  TrackingWater
//
//  Created by Drolllted on 05.08.2025.
//

import SwiftUI

import SwiftUI

struct SecondTapModalView: View {
    @Binding var selectedAmount: EnumVariables?
    @Environment(\.dismiss) var dismiss
    
    // Выносим логику работы с UserDefaults в отдельные функции
    private func saveSelectedAmount(_ amount: EnumVariables) {
        UserDefaults.standard.set(amount.rawValue, forKey: "lastSelectedAmount")
    }
    
    private func loadSelectedAmount() -> EnumVariables? {
        guard let savedValue = UserDefaults.standard.value(forKey: "lastSelectedAmount") as? Int else {
            return nil
        }
        return EnumVariables(rawValue: savedValue)
    }
    
    var body: some View {
        NavigationStack {
            listContent
                .navigationTitle("Select Amount")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                }
                .onAppear {
                    selectedAmount = loadSelectedAmount()
                }
        }
    }
    
    // Выносим содержимое List в отдельное вычисляемое свойство
    private var listContent: some View {
        List {
            ForEach(EnumVariables.allCases) { amount in
                rowContent(for: amount)
            }
        }
    }
    
    // Выносим содержимое строки в отдельную функцию
    private func rowContent(for amount: EnumVariables) -> some View {
        Button {
            selectedAmount = amount
            saveSelectedAmount(amount)
            dismiss()
        } label: {
            HStack(spacing: 16) {
                Image(systemName: "waterbottle.fill")
                    .foregroundColor(.blue)
                
                Text("\(amount.amountString) ml")
                    .foregroundColor(.primary)
                
                Spacer()
                
                if selectedAmount == amount {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
            .padding(.vertical, 8)
        }
    }
}
