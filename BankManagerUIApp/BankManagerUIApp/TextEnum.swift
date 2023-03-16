//
//  TextEnum.swift
//  BankManagerConsoleApp
//
//  Created by goat, Andrew on 2023/03/09.
//

import Foundation

enum BankingMessage {
    static let depositMessage: String = " - 예금"
    static let loanMessage: String = " - 대출"
}

enum ButtonText {
    static let addTenCustomer: String = "고객 10명 추가"
    static let reset: String = "초기화"
}

enum statusText {
    static let waitingStatus: String = "대기중"
    static let doBankingStatus: String = "업무중"
}
