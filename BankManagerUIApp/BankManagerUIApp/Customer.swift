//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Andrew, Gaot  on 2023/03/16.
//

import Foundation

enum Customer: String, CaseIterable {
    case loan = "대출"
    case deposit = "예금"
    
    var takenTimeForBanking: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    var deskCount: Int {
        switch self {
        case .deposit:
            return 2
        case .loan:
            return 1
        }
    }
}

