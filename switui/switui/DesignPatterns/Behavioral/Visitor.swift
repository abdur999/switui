//
//  Visitor.swift
//  switui
//
//  Created by Abdur Rahim on 16/01/25.
//

import Foundation
/*
Components of the Visitor Pattern:
Visitor: This is the interface that declares a visit method for each type of element in the object structure.
ConcreteVisitor: A class that implements the Visitor interface and defines the actual operations to be performed on the objects.
Element: The interface that defines an accept() method, which takes a visitor object.
ConcreteElement: Concrete classes that implement the accept() method. These are the elements that can be visited by the visitor.
ObjectStructure: A collection of elements that can be visited. This could be a collection, a tree, or another structure that holds the elements.
*/

/*
 Practical Use Case
 Scenario: Employee Salary Processing

 Let's say you're building a system to process employee data, and you need to perform different operations on different types of employees (e.g., full-time, part-time, and contractor). Each employee type might have its own logic for calculating salary, generating reports, etc.
 */
/*
 Key Points:
 Extending Behavior: Adding new operations, such as tax calculations or performance reviews, becomes easier. You only need to create new ConcreteVisitor classes. The Employee classes themselves don’t need modification.
 Separation of Concerns: The logic for calculating salaries or generating reports is separated from the Employee classes, which keeps the code more modular and easier to maintain.
 Open/Closed Principle: The Employee classes are open for extension (i.e., you can add more types of employees), but closed for modification (i.e., the logic of each type remains unchanged).
 */
/*
Benefits of the Visitor Pattern:
Separation of Concerns: The operations are separated from the elements, which makes the code more modular.
Ease of Adding New Operations: You can add new operations without changing the classes that represent the elements.
Reduced Duplication: Avoids having to implement the same logic across many classes.
Downsides:
Complexity: It can make the codebase more complex, especially when dealing with a large number of elements and visitors.
Inflexibility with New Element Types: If new types of Employee (or any other element) are introduced, you need to modify every existing Visitor to handle the new type.
 */
/*
 Use Cases for Visitor Pattern:
 Operations on Composite Structures: When you have a complex object structure (like a tree or a composite pattern) and need to perform different operations on various elements of the structure.
 Multiple Operations on a Set of Objects: If you need to apply multiple operations (like calculating taxes, discounts, shipping, etc.) on a set of objects, but you don't want to pollute the objects themselves with those operations.
 File Processing: In scenarios where you need to process different file formats (e.g., CSV, JSON, XML), the Visitor pattern can be used to separate the parsing and processing logic from the file format classes.
 */
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
