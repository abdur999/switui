//
//  BankAccount.swift
//  switui
//
//  Created by Abdur Rahim on 11/01/25.
//

import Foundation

//Feature of Actors
// 1. Automatic Serialization of Access
// 2. Concurrency Safety
// 3. Async/Await integration
// 4. Reference type

//Reason of using Actor
// 1. Concurrency safety
// 2. Automatic thread safety
// 3. Simplifies Asynchronous Code

//When to Use Actor
// 1. Thread-safe Operation
// 2. Shared mutable state

// Limitations
// 1. Performance overhead
// 2. Concerency Scope
// 3. Reference type only


actor BankAccount {
    private var balance : Int = 0
    let accountNumber: String = "1298756734909123490"
    func deposit(amount:Int) {
        balance += amount
    }
    func getBalance() -> Int {
        return balance
    }
    func copyScore(from other: BankAccount) async {
        balance = await other.balance
    }
    /*
     Non-isolated
     In Swift’s concurrency model, the concept of non-isolated members within an actor plays a crucial role. Non-isolated members allow certain parts of an actor to be accessed without the need for asynchronous calls or awaiting their turn in the actor’s task queue. This is particularly useful for properties or methods that do not modify the actor’s state and therefore do not contribute to race conditions or other concurrency issues.
     */
    nonisolated func getMaskedAccountNumber() -> String {
            return String.init(repeating: "*", count: 12) + accountNumber.suffix(4)
        }
}


/*
 
 Actors for Concurrency Management: We introduced Swift Actors as a pivotal part of the concurrency model in Swift 5.5, designed specifically to handle shared mutable state safely and to prevent data races.
 Addressing Concurrency Issues: We discussed common concurrency issues like race conditions, deadlocks, and livelocks, and demonstrated how actors can mitigate these problems. Traditionally, such issues were managed using DispatchQueue, Operations, and Locks.
 Thread Safety and Serial Execution: Actors enhance thread safety in Swift applications. They process tasks serially within an internal queue, functioning like a queue manager, ensuring that tasks are handled one at a time and thus avoiding concurrency conflicts.
 Understanding Cross-actor Reference: The concept of cross-actor reference is crucial. It necessitates the use of the await keyword for accessing actor properties or methods, marking potential suspension points for efficient task management.
 Serial Executors Versus DispatchQueues: We highlighted a key difference between the actor’s Serial Executor and Serial DispatchQueue. Actors are not bound to a strict first-in-first-out order and can prioritize tasks based on various factors, unlike DispatchQueues.
 Rules for Interacting with Actors: We outlined specific rules for interacting with actors, emphasizing the asynchronous access of mutable properties and the necessity of awaiting isolated functions.
 Non-isolated Members in Actors: We introduced the concept of non-isolated members within an actor. This is particularly useful for accessing certain properties or methods synchronously, without compromising thread safety.
 Practical Examples for Better Understanding: Through the Account actor example, we provided a practical understanding of how actors can be effectively utilized to maintain state safely in concurrent programming environments.
 Future Insights into Executors: We promised a deeper dive into Executors in future discussions, anticipating a more detailed exploration of this aspect of Swift’s concurrency model.
 */
