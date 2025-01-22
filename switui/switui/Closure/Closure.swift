//
//  Closure.swift
//  switui
//
//  Created by Abdur Rahim on 22/01/25.
//

import Foundation


/*
 Closures in Swift are self-contained blocks of functionality that can be passed around in your code and used later. They are similar to **blocks** in Objective-C and **lambdas** in other languages. Closures can take parameters, return values, and capture variables from the surrounding context.
 */
/*
 Closure syntax
 { (parameters) -> returnType in
        // closure body
 }
 */
struct Closure {
    // Function
    func addNumbers(a: Int, b: Int) -> Int {
        return a + b
    }
    // Closure
    let add = { (a: Int, b: Int) -> Int in
        return a + b
    }
    // Nested Functions (Closures Inside Functions)
    func makeAdder(incrementAmount: Int) -> (Int) -> Int {
        func adder(number: Int) -> Int {
            return number + incrementAmount
        }
        return adder
    }
    
    // Trailing Closure
    func doSomething(completion: () -> Void) {
        print("Starting task...")
        completion()
        print("Task finished!")
    }
    
    //Escaping Closure
    func performAsyncTask(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion()  // called after function returns
        }
    }
    
    // Closure CustomSorting
    func closureSorting(){
        let people = [("John", 25), ("Anna", 32), ("Zoe", 30)]
        let sortedPeople = people.sorted { $0.1 < $1.1 }
    }
    
    func shortLivedClosure() {
        let numbers = [1, 2, 3, 4]
        let doubledNumbers = numbers.map { $0 * 2 }
        print(doubledNumbers) // Output: [2, 4, 6, 8]
    }
    
    func fetchDataFromNetwork(completion: @escaping (String) -> Void) {
        DispatchQueue.global().async {
            // Simulating a network call
            sleep(2)
            completion("Data loaded")
        }
    }
    func makeIncrementer(incrementAmount: Int) -> () -> Int {
          var total = 0
          let incrementer: () -> Int = {
              total += incrementAmount
              return total
          }
          return incrementer
      }
    func sortClosure() {
        let people = [("John", 25), ("Anna", 32), ("Zoe", 30)]
           let sortedPeople = people.sorted { $0.1 < $1.1 }
           print(sortedPeople) // Output: [("John", 25), ("Zoe", 30), ("Anna", 32)]
    }
    func filterClosure() {
        let numbers = [1, 2, 3, 4, 5, 6]
        let evenNumbers = numbers.filter { $0 % 2 == 0 }
        print(evenNumbers)  // Output: [2, 4, 6]
    }
    func reduceClosure() {
        let numbers = [1, 2, 3, 4]
        let sum = numbers.reduce(0) { $0 + $1 }
        print(sum)  // Output: 10
    }
    func sortClosurre() {
        let names = ["Alice", "Bob", "Eve"]
        let sortedNames = names.sorted { $0 < $1 }
        print(sortedNames)  // Output: ["Alice", "Bob", "Eve"]
    }
    func forEachloop() {
        let numbers = [1, 2, 3, 4]
         numbers.forEach { print($0) }
         // Output: 1 2 3 4
    }
    func performOperation<T>(on array: [T], using closure: (T) -> T) -> [T] {
        var result = [T]()
        for item in array {
            result.append(closure(item))
        }
        return result
    }
    func makeMultiplier(multiplier: Int) -> (Int) -> Int {
        return { number in
            print("Number is \(number), Multiplier is \(multiplier)")
            return number * multiplier
        }
    }

    
}
struct CallClosure {
    func callFunction() {
        let addFive = Closure().addNumbers(a: 2, b: 3)
        print(addFive) // Output: 5
    }
    func callClosure() {
        print(Closure().add(5, 3)) // Output: 8
    }
    func callNestedClosure() {
        let addFive = Closure().makeAdder(incrementAmount: 5)
        print(addFive(10)) // Output: 15
    }
    func trailingClosureCall() {
        Closure().doSomething {
            print("Task is in progress!")
        }
    }
    func escapeClosure(){
        Closure().performAsyncTask {
            print("Async task completed!")
        }
    }
    func callIncrementerClosure() {
        let incrementByFive = Closure().makeIncrementer(incrementAmount: 5)
         print(incrementByFive()) // Output: 5
         print(incrementByFive()) // Output: 10
         print(incrementByFive()) // Output: 15
    }
    func performTemplateOPeration() {
        let numbers = [1, 2, 3, 4]
        let incrementedNumbers = Closure().performOperation(on: numbers) { $0 + 1 }
        print(incrementedNumbers)  // Output: [2, 3, 4, 5]
    }
    func callFunctions() {
        callFunction()
        callClosure()
        callNestedClosure()
        trailingClosureCall()
        escapeClosure()
        Closure().closureSorting()
        Closure().fetchDataFromNetwork { result in
              print(result)  // Output after 2 seconds: "Data loaded"
          }
        callIncrementerClosure()
        Closure().sortClosure()
        let multiplyByThree = Closure().makeMultiplier(multiplier: 3)
        print(multiplyByThree(5))  // Output: 15

    }
}
