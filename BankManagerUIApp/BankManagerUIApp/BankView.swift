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
    
    let currentStatusStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.backgroundColor = .white
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
    
    let timerLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "업무시간"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        return label
    }()
    
    let waitingStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(statusText.waitingStatus)"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemGreen
        return label
    }()
    
    private let doBankingStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(statusText.doBankingStatus)"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        return label
    }()
    
    func setUpConstantsOnView() {
        let safeLayout = safeAreaLayoutGuide
        self.addSubview(topLayerStackView)
      
        topLayerStackView.addArrangedSubview(buttonStackView)
        topLayerStackView.addArrangedSubview(timerLabel)
        topLayerStackView.addArrangedSubview(currentStatusStackView)

        buttonStackView.addArrangedSubview(addTenCustomerButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        currentStatusStackView.addArrangedSubview(waitingStatusLabel)
        currentStatusStackView.addArrangedSubview(doBankingStatusLabel)
        
        NSLayoutConstraint.activate([
            topLayerStackView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
            topLayerStackView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
            topLayerStackView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor)
        ])
    }
}

