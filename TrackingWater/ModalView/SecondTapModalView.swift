//
//  FirstTapModalView.swift
//  TrackingWater
//
//  Created by Drolllted on 05.08.2025.
//

import SwiftUI

struct SecondTapModalView: View {
    
    @Binding var selectedML: EnumVariables?
    
    var body: some View {
        List{
            ForEach(EnumVariables.allCases, id: \.self) { amount in
                Section {
                    HStack(spacing: 16){
                        Image(systemName: "waterbottle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                        
                        Text("\(amount.amountString) ml")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        if selectedML == amount {
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.blue)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.vertical, 8)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedML = amount
                        }
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
    }
}
