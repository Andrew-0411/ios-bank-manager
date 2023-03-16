//
//  BankManager.swift
//  BankManagerUIApp
//
//  Created by Goat, Andrew on 2023/03/16.
//

import Foundation

class BankManager {
    private var customerQueue: BankQueue<BankingType> = BankQueue<BankingType>()
    var customerCount: Int = 0
    private var semaphoreValue: Int = 0
    private lazy var semaphore = DispatchSemaphore(value: semaphoreValue)
    
    private func insertCustomerCountToQueue() {
        for i in 1...customerCount {
            guard let count = BankingType.init(customerNumber: i) else { return }
            self.customerQueue.enqueue(data: count)
        }
    }
    
    func banking() {
        let group = DispatchGroup()
        let depositDispatchQueuqe = DispatchQueue(label: "depositDispatchQueuqe")
        let loanDispatchQueue = DispatchQueue(label: "loanDispatchQueue")
        
        
        while customerQueue.isEmpty() == false {
            guard let currentCustomer = customerQueue.peek() else { return }
            semaphoreValue = currentCustomer.customer.deskCount
            switch currentCustomer.customer {
            case .deposit:
                depositDispatchQueuqe.async(group: group) {
                    self.semaphore.wait()
                    print("\(currentCustomer.customerNumber)\(BankingMessage.depositMessage)")
                    Thread.sleep(forTimeInterval: currentCustomer.customer.takenTimeForBanking)
                    self.semaphore.signal()
                }
            case .loan:
                loanDispatchQueue.async(group: group) {
                    self.semaphore.wait()
                    print("\(currentCustomer.customerNumber)\(BankingMessage.loanMessage)")
                    Thread.sleep(forTimeInterval: currentCustomer.customer.takenTimeForBanking)
                    self.semaphore.signal()
                }
            }
            self.customerQueue.dequeue()
        }
        group.wait()
    }
    
    
    
}
