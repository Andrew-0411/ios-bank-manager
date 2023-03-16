//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private var bankManager = BankManager()
    private var bankView = BankView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = bankView
        setUpView()
    }
    
    @objc func createCustomerCount() {
        bankManager.customerCount += 10
    }
    
    private func setUpView(){
        bankView.setUpConstantsOnView()
        addButton()
    }
    
    private func addButton(){
        bankView.addTenCustomerButton.addTarget(self, action: #selector(createCustomerCount), for: .touchUpInside)
    }
}

