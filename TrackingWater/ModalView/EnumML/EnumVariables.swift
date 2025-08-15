//
//  EnumVariables.swift
//  TrackingWater
//
//  Created by Drolllted on 15.08.2025.
//

import Foundation

enum EnumVariables: Int, CaseIterable, Identifiable {
    var id: Int { rawValue }
    
    case oneHundred, twoHundred, twoHundredhalf, fiftyHundred, oneLitr
    
    var amountAdd: Double {
        switch self{
            
        case .oneHundred:
            return 100
        case .twoHundred:
            return 200
        case .twoHundredhalf:
            return 250
        case .fiftyHundred:
            return 500
        case .oneLitr:
            return 1000
        }
    }
    
    var amountString: String{
        switch self {
            
        case .oneHundred:
            return "100"
        case .twoHundred:
            return "200"
        case .twoHundredhalf:
            return "250"
        case .fiftyHundred:
            return "500"
        case .oneLitr:
            return "1000"
        }
    }
    
}
