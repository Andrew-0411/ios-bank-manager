//
//  bankView.swift
//  BankManagerUIApp
//
//  Created by Goat,Andrew on 2023/03/16.
//

import UIKit

final class BankView: UIView {
  
    let topLayerStackView: UIStackView = {
    let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        stackView.backgroundColor = .white
        return stackView
     }()
    
    let addTenCustomerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    func setUpConstantsOnView() {
        self.addSubview(topLayerStackView)
        topLayerStackView.addArrangedSubview(addTenCustomerButton)
    }
    
    
    
    }

