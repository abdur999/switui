//
//  LiskovSubstitution.swift
//  switui
//
//  Created by Abdur Rahim on 12/01/25.
//

import Foundation

/*
 Subclass don't override or break the behaviour of the superclass
 Clients using a superclass or protocol should need to know if they are interacting witha subclass
 */

//Without LSP

class Rectangle {
    private var width: Double = 0
    private var height: Double = 0
    
    func setWidth(_ width:Double) {
        self.width = width
    }
    func setHeight(_ height:Double) {
        self.height = height
    }
    func area() -> Double {
        return width * height
    }
}
class Squre: Rectangle {
    override func setWidth(_ width: Double) {
        super.setWidth(width)
        super.setHeight(width)
    }
    override func setHeight(_ height: Double) {
        super.setWidth(height)
        super.setHeight(height)
    }
}
/*
 Why this violate LSP
 A Square object does not behave like a rectangle
 The printArea(of:) function assumes the setWidth and setHeight methods work independently which is not true for Square
 */


//Refactor the above design to adhere to LSP by using a protocol and seperating Rectangle and Square into distinct type
protocol ShapeX {
    func area() -> Double
}
class RectangleX : ShapeX {
    private var width: Double = 0
    private var height: Double = 0
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    func area() -> Double {
       return width*height
    }
}
class SquareX : ShapeX {
    private var side: Double = 0
    init(side: Double) {
        self.side = side
    }
    func area() -> Double {
        return side*side
    }
}
class AreaCalculator {
    func printArea(of shape: ShapeX) {
        print("Area: \(shape.area())")
    }
}
