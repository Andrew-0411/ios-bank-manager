//
//  BankingType.swift
//  BankManagerUIApp
//
//  Created by 송종환 on 2023/03/16.
//

import Foundation

struct BankingType {
    let customer: Customer
    let customerNumber: Int
    
    init?(customerNumber: Int){
        guard let customer = Customer.allCases.randomElement() else { return nil }
    
        self.customer = customer
        self.customerNumber = customerNumber
    }
}
