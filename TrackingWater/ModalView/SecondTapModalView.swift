//
//  FirstTapModalView.swift
//  TrackingWater
//
//  Created by Drolllted on 05.08.2025.
//

import SwiftUI

struct SecondTapModalView: View {
    @Binding var selectedAmount: EnumVariables?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(EnumVariables.allCases) { amount in
                    Button {
                        selectedAmount = amount
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
            .navigationTitle("Select Amount")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
