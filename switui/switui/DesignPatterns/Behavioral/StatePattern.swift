//
//  StatePattern.swift
//  switui
//
//  Created by Abdur Rahim on 16/01/25.
//


/*
 Components of the State Pattern
 Context: This class maintains the current state of the object and delegates state-specific behavior to the current state object. The Context typically provides an interface to change the current state.
 State Interface: This interface defines methods for handling actions based on the state of the context. These methods are implemented by the concrete states.
 Concrete States: These are the different states that implement the State interface. Each state defines the behavior associated with that particular state.
 Transition: While the transition between states is often handled by the Context class, in some cases, the states themselves may decide when and how to transition.
 
 Practical Example: Vending Machine
 Imagine building a Vending Machine. The vending machine can be in various states like "Waiting for money", "Has money", "Dispensing item", and "Out of stock". The behavior of the vending machine (e.g., accepting money, dispensing items) changes depending on its state.

 Without the State Pattern, you might end up with complex conditional logic that mixes the state-specific behaviors, which makes the code hard to maintain.
 */
/*
 Key Concepts of the State Pattern:
 State Interface: The State interface defines the common behavior that all concrete states must implement, ensuring a consistent API for state-specific actions like insert_money and dispense_item.
 Concrete States: The WaitingForMoney, HasMoney, and OutOfStock classes implement the State interface and provide specific behavior for their respective states.
 Context Class: The VendingMachine class is the context that maintains the current state and delegates the state-specific behavior to the state object. It can transition between different states dynamically.
 State Transitions: The state transitions are encapsulated within the state classes themselves, making the code more flexible and easier to maintain.
 Advantages of the State Pattern:
 Simplifies Complex State Logic: Instead of having large conditional blocks in the context class, the state-specific behavior is encapsulated within each state class, making the code easier to read, maintain, and extend.
 Promotes Open/Closed Principle: New states can be added without modifying the VendingMachine class. The code is closed for modification but open for extension.
 Decouples Behavior from Context: The behavior of the object is decoupled from the context. The VendingMachine doesn't need to know the details of each state, just how to delegate actions to the current state.
 Improves Maintainability: Adding new states or changing the behavior of existing ones is easier, as each state is isolated and doesn't require modification of the context class.
 Enforces Correct Transitions: The state pattern ensures that the correct actions are executed for each state, reducing the risk of invalid transitions and errors in the program.
 Disadvantages of the State Pattern:
 Increased Number of Classes: Each state requires a new class, which can lead to a larger number of classes in the system. This might be overkill if the number of states is small or the behavior is simple.
 Complexity: For simpler systems, the introduction of the state pattern might introduce unnecessary complexity. It’s most beneficial when there are multiple states with complex transitions.
 State Duplication: In some cases, different states may share similar behaviors. Without careful design, the pattern could lead to code duplication in the concrete state classes.
 
 Use Cases for State Pattern:
 UI Components: For example, in a form with different validation states (e.g., "valid", "invalid", "submitting"), the behavior of the form changes based on its current state. The State Pattern can help encapsulate each state and its behavior.
 Workflow Management Systems: In systems with multiple stages (e.g., order processing, where orders can be in "pending", "approved", "shipped", or "delivered" states), the state pattern can manage different behaviors for each stage.
 Gaming Systems: In games, a character or object may have different states such as "idle", "moving", "attacking", or "dead", and its behavior changes depending on the current state.
 Traffic Lights: A traffic light has different states (e.g., "red", "yellow", "green"), and the actions (like "change light" or "start timer") are dependent on the current state of the light.
 Audio/Media Players: A media player may have different states such as "playing", "paused", and "stopped", with different behaviors (e.g., play, pause, stop buttons) for each state.

 */


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
