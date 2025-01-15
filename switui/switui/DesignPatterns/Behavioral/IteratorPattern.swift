//
//  IteratorPattern.swift
//  switui
//
//  Created by Abdur Rahim on 15/01/25.
//

import Foundation

protocol Iterator {
    associatedtype UElement
    func next() -> UElement
    func hasNext() -> Bool
}

class ArrayIteratorU<T>:Iterator {
    private var array:[T]
    private var index = 0
    init(array: [T]) {
        self.array = array
    }
    func next() -> T? {
        guard index < array.count else { return nil }
        let item = array[index]
        index+=1
        return item
    }
    func hasNext() -> Bool {
        return index < array.count
    }
}
