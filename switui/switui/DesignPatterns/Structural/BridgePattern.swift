//
//  BridgePattern.swift
//  switui
//
//  Created by Abdur Rahim on 14/01/25.
//

import Foundation

//Abstract class for PaymentMethod
protocol PaymentMethod {
    func processPayment(amount:Double)
}

//Concrete implementation for CreditCard
class CreditCardPay : PaymentMethod {
    func processPayment(amount: Double) {
        print("Processing credit card payment of \(amount) USD")
    }
}

//Concrete implementation for PayPalPay
class PayPalPay: PaymentMethod {
    func processPayment(amount: Double) {
        print("Processing Paypal payment of \(amount) USD")
    }
}

//PaymentProcessor class (Bridge)
class PaymentProcesor {
    private let paymentMethod:PaymentMethod
    
    init(paymentMethod: PaymentMethod) {
        self.paymentMethod = paymentMethod
    }
    func pay(amount:Double) {
        paymentMethod.processPayment(amount: amount)
    }
}

