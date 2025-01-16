//
//  StatePattern.swift
//  switui
//
//  Created by Abdur Rahim on 16/01/25.
//

import Foundation
/*
 Thev state pattern allows an object to change its behaviour when its behaviour when its internal state changes. This is particularly useful for managing state transtions
 Example Vending Machine
 */
protocol VendingMachineState {
    func insertCoin()
    func selectProduct()
    func dispenseProduct()
}
class VendingMachine {
    private var state: VendingMachineState?
    private var stock:Int
    init(initialStock:Int) {
        self.stock = initialStock
        self.state = IdleState(vendingMachine: self) //Initialized after self is available
    }
    
    func setState(_ state:VendingMachineState) {
        self.state = state
    }
    func decreaseStock() {
        stock  = stock-1
    }
    func hasStock() -> Bool {
        return stock > 0
    }
    func insertCoin() {
        state?.insertCoin()
    }
    func selectProduct() {
        state?.selectProduct()
    }
    func dispenseProduct() {
        state?.dispenseProduct()
    }
}

class IdleState: VendingMachineState
{
    private var vendingMachine:VendingMachine
    
    init(vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }
    func insertCoin() {
        print("Coin Inserted, you can now select product")
        vendingMachine.setState(HasCoinState(vendingMachine: vendingMachine))
    }

    func selectProduct() {
        print("Insert coin first before selecting a product")
    }
    
    func dispenseProduct() {
        print("You need to Insert coin fand select a product first")
    }
}


class HasCoinState: VendingMachineState
{
    private var vendingMachine:VendingMachine
    
    init(vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }
    func insertCoin() {
        print("Coin already Inserted, select a product")
        
    }

    func selectProduct() {
        if vendingMachine.hasStock() {
            print("Product selected.Dispensing now ...")
            vendingMachine.setState(DispensingState(vendingMachine: vendingMachine))
            vendingMachine.dispenseProduct()
        } else {
            print("Product is out of stock")
            vendingMachine.setState(OutOfStockState(vendingMachine: vendingMachine))
        }
    }
    
    func dispenseProduct() {
        print("Select a product first befor dispensing ...")
    }
}

class DispensingState: VendingMachineState {
    private let vendingMachine:VendingMachine
    
    init(vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }
    func insertCoin() {
        print("Dispensing in progress, please wait ...")
    }

    func selectProduct() {
        print("Dispensing in progress, please wait ...")
    }
    
    func dispenseProduct() {
        vendingMachine.decreaseStock()
        print("Product dispensed successfully")
        
        if vendingMachine.hasStock() {
            vendingMachine.setState(IdleState(vendingMachine: vendingMachine))
        } else {
            print("machine is now out of stock")
            vendingMachine.setState(OutOfStockState(vendingMachine: vendingMachine))
        }
    }

}
class OutOfStockState: VendingMachineState {
    private let vendingMachine: VendingMachine
    init(vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }
    func insertCoin() {
        print("Cannot insert money. The machine is out of stock ...")
    }
    
    func selectProduct() {
        print("Cannot Select product . The machine is out of stock ...")
    }
    
    func dispenseProduct() {
        print("Cannot dispense. The machine is out of stock ...")
    }
}
