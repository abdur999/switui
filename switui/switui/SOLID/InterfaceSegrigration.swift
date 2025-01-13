//
//  InterfaceSegrigration.swift
//  switui
//
//  Created by Abdur Rahim on 13/01/25.
//

import Foundation


// A cleint should not be forced to depend on interface it does not use

/*
 In swift, this principle ensures that interfaces or protocols are  designed with minimal methods, specific to the client's needs, rather than creating monolithic interfaces with unnecessary methods.
 */

//Dont Follow IS(Interface Sgrigration)
protocol Vehicle {
    func startEngine()
    func stopEngine()
    func fly()
}

class ICar: Vehicle {
    func startEngine() {
        print("Car engine started")
    }
    
    func stopEngine() {
        print("Car engine stopped")
    }
    
    // Violation: Car does not need to implemenmt 'fly', but it forced to
    func fly() {
        print("Car cannot fly!")
    }
}

class IAirplane: Vehicle {
    func startEngine() {
        print("Airplane engine started")
    }
    
    func stopEngine() {
        print("Airplane engine stopped")
    }
    
    func fly() {
        print("Airplane is flying")
    }
}


protocol EngineOperable {
    func startEngine()
    func stopEngine()
}
protocol Flyable {
    func fly()
}

class ICarx: EngineOperable {
    func startEngine() {
        print("Car engine started")
    }
    
    func stopEngine() {
        print("Car engine stopped")
    }
}
class IAirplanex:Flyable, EngineOperable {
    func startEngine() {
        print("Airplane engine started")
    }
    
    func stopEngine() {
        print("Airplane engine stopped")
    }
    
    func fly() {
        print("Airplane is flying")
    }
}
/*
 Benefits of Following ISP
 1. Single Responsibility : Each protocol has a specific purpose
 2. Ease of use: Classes conform only to protocl relevant to them
 3. Maintainability: Modifying one protocol has minimal impact or unrelated classes
 */
/*
 This way Car is no longer forced to implement fly() method and Airplane can implement both EngineOperable and Flyable protocols as needed adhering  to the Interface segrigration principle
 */

