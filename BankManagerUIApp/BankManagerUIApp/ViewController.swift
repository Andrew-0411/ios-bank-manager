//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var bankManager = BankManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
    func createCustomerCount() {
        bankManager.customerCount += 10
    }
}

