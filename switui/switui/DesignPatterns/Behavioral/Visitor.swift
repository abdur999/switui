//
//  Visitor.swift
//  switui
//
//  Created by Abdur Rahim on 16/01/25.
//

import Foundation


protocol ShapeV {
    func accept(visitor:ShapeVisitorV)
}
protocol ShapeVisitorV {
    func visitRectangle(visitor:RectangleV)
    func visitCircle(visitor:CircleV)
}
class RectangleV:ShapeV {
    func accept(visitor: ShapeVisitorV) {
        visitor.visitRectangle(visitor: self)
    }
}
class CircleV:ShapeV {
    func accept(visitor: ShapeVisitorV) {
        visitor.visitCircle(visitor: self)
    }
}
class ShapeAreaCalculator:ShapeVisitorV {
    func visitRectangle(visitor: RectangleV) {
        print("Calculate are of Rectangle")
    }
    
    func visitCircle(visitor: CircleV) {
        print("Calculate are of Circle")
    }
}
