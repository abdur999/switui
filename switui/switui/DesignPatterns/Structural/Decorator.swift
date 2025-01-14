//
//  Decorator.swift
//  switui
//
//  Created by Abdur Rahim on 14/01/25.
//

import Foundation

/*
 The decorator pattern allows you to add functionality to an object dynammically without affecting its structure. This is especially useful when you need to add responsibilities to objects in a flexible and reusable way
 */
// Base Drink class
protocol Drink {
    func cost() -> Double
}

//Concrete implementation of a Drink
class Cofee: Drink {
    func cost() -> Double {
        return 5.0
    }
}

//Decorator class that adds extra features to the base drink
class MilkDecorator: Drink {
    private let drink:Drink
    init(drink: Drink) {
        self.drink = drink
    }
    func cost() -> Double {
        return drink.cost() + 1.5
    }
}

//Another Decorator
class SugarDecorator: Drink {
    private let drink:Drink
    init(drink: Drink) {
        self.drink = drink
    }
    func cost() -> Double {
        return drink.cost() + 1.5
    }
}
