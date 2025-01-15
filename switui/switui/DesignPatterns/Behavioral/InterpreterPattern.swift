//
//  InterpreterPattern.swift
//  switui
//
//  Created by Abdur Rahim on 15/01/25.
//

import Foundation
protocol Expression {
    func interpret() -> Int
}
class NumberExpression:Expression {
    private let number:Int
    init(number: Int) {
        self.number = number
    }
    func interpret() -> Int {
        return number
    }
}

class AddExpression:Expression {
    private let left:Expression
    private let right:Expression
    init(left: Expression, right:Expression) {
        self.left = left
        self.right = right
    }
    func interpret() -> Int {
        return left.interpret() + right.interpret()
    }
}

class SubstractExpression:Expression {
    private let left:Expression
    private let right:Expression
    init(left: Expression, right:Expression) {
        self.left = left
        self.right = right
    }
    func interpret() -> Int {
        return left.interpret() - right.interpret()
    }
}
