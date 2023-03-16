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
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.backgroundColor = .yellow
        return stackView
    }()

    let addTenCustomerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("\(ButtonText.addTenCustomer)", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("\(ButtonText.reset)", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    func setUpConstantsOnView() {
        
        let safeLayout = safeAreaLayoutGuide
        self.addSubview(topLayerStackView)
      
        topLayerStackView.addArrangedSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(addTenCustomerButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        NSLayoutConstraint.activate([
            topLayerStackView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
            topLayerStackView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor),
            topLayerStackView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
            topLayerStackView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor)
        ])
    }
}

