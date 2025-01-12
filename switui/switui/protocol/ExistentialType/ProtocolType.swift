//
//  ProtocolType.swift
//  switui
//
//  Created by Abdur Rahim on 12/01/25.
//

import Foundation


// Characterstics of Existential type
/*
 TYPE ERASURE : The caller of the function doesn't know the specific type being returned (Here Circle / Square), only that it conforms shape protocol
 Dynamic Dispatch : Existential types rely on dynamic dispatch to call methods at runtime, which can be slightly slower compared to compile-time dispatch
 Flexilibity : A function returning an existential type can return different concrete types based on conditions.
 */

// Limitation of existential types
/*
 Cannot be used with assocatedType : If the protocol has associatedtype/Self requirements, it cannot be used as an existential type. To handle such cases use opaque types.
 Dynamic Dispatch overhead : Since method calls on existential types are dynamically dispatched, they are slower than calls on concrete types or opaque type
 */

//Best Practices
/*
 Use existentialtype(Protocol) when you need maximum flexibility and polymorphism (returning different concrete type)
 Use Opaque types (some protocol) when you want to maintain type safety and compile time optimizations but still provide abstraction.
 */

//When to use
/*
 existential types are essential for creating flexible for creating flexible APIs and implementing polymorphism, especially in  scenarios where different types share common behaviour defined by protocol
 */
enum AnimalType {
    case dog
    case cat
    case cow
    case tiger
    case anonymus
}
protocol Animal {
    func makeSound() -> String
}
struct Dog : Animal {
    func makeSound() -> String {
        return "Bark"
    }
}
struct Cat : Animal {
    func makeSound() -> String {
        return "Meow"
    }
}
struct Cow : Animal {
    func makeSound() -> String {
        return "humbah"
    }
}
struct Tiger : Animal {
    func makeSound() -> String {
        return "Roar"
    }
}
struct Anonymus : Animal {
    func makeSound() -> String {
        return "Anonymus sound"
    }
}
struct ExistentialType {
    func getAnimal(type:AnimalType) -> Animal {
        switch type {
                
            case .dog:
                return Dog()
            case .cat:
                return Cat()
            case .cow:
                return Cow()
            case .tiger:
                return Tiger()
            case .anonymus:
                return Anonymus()
        }
    }
}
