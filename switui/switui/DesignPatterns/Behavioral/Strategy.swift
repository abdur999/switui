//
//  Strategy.swift
//  switui
//
//  Created by Abdur Rahim on 16/01/25.
//

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
