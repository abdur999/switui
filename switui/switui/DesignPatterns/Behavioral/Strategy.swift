//
//  Strategy.swift
//  switui
//
//  Created by Abdur Rahim on 16/01/25.
//

/*
 Components of Strategy Pattern:
 Context: The Context class is responsible for using a Strategy object to perform a certain behavior. It is configured with a specific strategy and delegates the algorithm to the strategy object.
 Strategy Interface: This defines a common interface for all concrete strategies. The Context will interact with this interface.
 Concrete Strategies: These are classes that implement the Strategy interface and provide specific implementations of the algorithm. Each concrete strategy can implement a different version of the algorithm.
 */
/*
 Key Concepts of Strategy Pattern:
 Strategy Interface: Defines a common interface for all payment methods, ensuring that each payment method implements the process_payment method.
 Concrete Strategies: CreditCardPayment, PayPalPayment, and BankTransferPayment are concrete classes implementing the PaymentStrategy interface. Each class contains its own logic for processing payments.
 Context: The PaymentProcessor class is the context. It holds a reference to the strategy object and delegates the payment processing to that strategy. It can change strategies dynamically using set_strategy().
 Decoupling: The payment processing logic is decoupled from the PaymentProcessor class, making it easy to extend without changing the core logic.
 */
/*
 Advantages of Strategy Pattern:
 Open/Closed Principle: The Strategy Pattern adheres to the Open/Closed Principle because we can add new strategies (payment methods) without modifying the existing PaymentProcessor code.
 Flexibility: At runtime, we can change the algorithm (payment method) dynamically using set_strategy(). This gives us flexibility in handling different payment methods based on user preference.
 Avoids Conditional Logic: By using separate strategy classes for each payment method, we eliminate the need for lengthy if-else or switch statements in the code, making it cleaner and more maintainable.
 Extensibility: New strategies can be added easily without modifying existing code. For example, if we want to add a new payment method like "Bitcoin", we simply create a new class implementing the PaymentStrategy interface.
 Separation of Concerns: Each payment method is encapsulated in its own class, allowing each strategy to focus on its specific logic, while the PaymentProcessor class only focuses on using the chosen strategy.
 */
/*
 Disadvantages of Strategy Pattern:
 Increased Number of Classes: The Strategy Pattern can lead to an increased number of classes. If there are many strategies, the number of classes in the system can grow significantly, leading to complexity.
 Context-Specific Setup: The Context needs to maintain a reference to the strategy. In cases where the context requires multiple strategies or the ability to switch between strategies frequently, this can introduce overhead in managing the state of the strategies.
 Interface Dependency: The strategies all depend on a common interface. If the interface needs to change (e.g., adding new methods), all the strategy classes must be updated accordingly.
 Not Ideal for Simple Algorithms: If the problem domain only involves simple and inflexible algorithms, the Strategy Pattern might be over-engineered. It’s best suited for complex scenarios where multiple interchangeable behaviors are required.
 */
/*
 Use Cases for Strategy Pattern:
 Payment Processing: As shown in the example, different payment methods (Credit Card, PayPal, Bank Transfer) can be modeled using the Strategy Pattern, allowing the system to switch payment strategies based on user choice.
 Sorting Algorithms: If your application needs to sort data in different ways (ascending, descending, by specific fields), you can use the Strategy Pattern to allow users to choose the sorting strategy dynamically.
 Compression/Encryption Algorithms: In systems that need to apply different compression or encryption algorithms (e.g., ZIP, RAR, GZIP), the Strategy Pattern allows the system to select the algorithm at runtime.
 Discount Calculation: In an e-commerce application, different types of discounts (e.g., percentage discount, fixed amount discount, buy-one-get-one-free) can be modeled as strategies, allowing the discount calculation to be selected based on the context.
 Route Calculation: In navigation systems, different strategies can be employed to calculate the best route based on criteria like time, distance, or traffic conditions. Users can switch between strategies depending on their preferences.
 */

import Foundation

/*
 The strategy pattern allows a client to choose an algorithm dynamically without altering the context in which it is used
 Example: Sorting strategies
 */
protocol SortedStrategy {
    func sort(array:[Int]) -> [Int]
}
class QuickSort:SortedStrategy {
    func sort(array: [Int]) -> [Int] {
        print("Sorted by quickSort")
        return array.sorted()
    }
}
class MergeSort:SortedStrategy {
    func sort(array: [Int]) -> [Int] {
        print("Sorted by mergeSort")
        return array.sorted()
    }
}

class Context {
    private var strategy:SortedStrategy
    
    init(strategy: SortedStrategy) {
        self.strategy = strategy
    }
    func setStrategy(strategy:SortedStrategy) {
        self.strategy = strategy
    }
    func executeSort(array:[Int]) -> [Int] {
        return strategy.sort(array: array)
    }
}
