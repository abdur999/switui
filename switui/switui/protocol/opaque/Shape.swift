//
//  Shape.swift
//  switui
//
//  Created by Abdur Rahim on 11/01/25.
//

import Foundation


//Why we use Opaque Type?
/*
 Type Abstraction
 Encapsulation
 */

// When to use opaque type ?
/*
 When the caller need to know the specific type but wants to rely on protocol conformance
 When you want to maintain encapsulation and avoid exposing implementation details
 For performance-critical code where avoiding dynamic dispatch is important (eg, Swiftui heavily uses opaque types
 */

// Key points about protocol type
/*
 Caller knows the protocol, not the type
 Consistent return type
 Default implementation in protocols
 */
protocol Shape {
    func draw() -> String
}
struct Circle: Shape {
    var radius:Float
    func draw() -> String {
        return "Drawing a Circle with radius\(radius)"
    }
}
struct Square: Shape {
    var width:Float
    func draw() -> String {
        return "Drawing a Square \(width)"
    }
}
// This is not working as the function need to return only a single specific type
// We must have to return either Circle / Square when we use opaque type we have to return either Circle or Square from the body.
func craeteShape(isCircle:Bool) -> some Shape {
    if isCircle {
        return Circle(radius: 10)
    } else {
        return Circle(radius: 20)
    }
}
