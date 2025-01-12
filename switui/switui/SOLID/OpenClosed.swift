//
//  OpenClosed.swift
//  switui
//
//  Created by Abdur Rahim on 12/01/25.
//

import Foundation

// Bad design principle violate Single Open/Closed Principle
class PaymentProcessor {
    func processPayment(method:String, amount: Double) {
        if method == "CreditCard" {
            print("Processing credit card payment of $\(amount)")
        } else if method == "PAyPAl" {
            print("Processing PAyPAl payment of $\(amount)")
        } else {
            print("Unsupportd payment method")
        }
    }
}
/*
 Problems
 1. Adding new payment methods requires modifying the processPayment method
 2. Increase the likelihood of introducing bugs in the existing code.
 */

// Good design principle violate Single Open/Closed Principle
// Protocol for payment methods
protocol PayemntMethod {
    func processPayment(amount:Double)
}

//Concrete implementations for each payment method
class CreditCardPayemnt: PayemntMethod {
    func processPayment(amount: Double) {
        print("Processing Credit Card payment of $\(amount)")
    }
}
class PayPalPayemnt: PayemntMethod {
    func processPayment(amount: Double) {
        print("Processing PayPal payment of $\(amount)")
    }
}

//Payment processor that depends on abstraction
class PaymentMethodProcessor {
    private var paymentMethod: PayemntMethod
    
    init(paymentMethod: PayemntMethod) {
        self.paymentMethod = paymentMethod
    }
    func processPayemnt(amount:Double) {
        paymentMethod.processPayment(amount: amount)
    }
}
/*
 Benefits of OCP
 1. OPen for extension: Adding a new payment method (eg ApplePayment) only requires creating a new class conforming to Paymentmethod
 2. Closed for Modification: The existing PaymentProcessor and other payment methods remain untouched, reducing the risk of breaking existing functionality
 3. Scalability: The design scales easily as you add more payment methods without affecting existing code
 */
