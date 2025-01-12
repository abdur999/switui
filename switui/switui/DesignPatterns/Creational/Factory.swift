//
//  Factory.swift
//  switui
//
//  Created by Abdur Rahim on 12/01/25.
//

import Foundation

enum ECar {
    case bmw
    case audi
}
struct Car {
    var brand: String
    var model: String
    init(brand: String, model: String) {
        self.brand = brand
        self.model = model
    }
}
protocol Factory {
    func printCar(car:Car)
}
class Audi: Factory {
    func printCar(car:Car) {
        print("Audi")
    }
}
class BMW: Factory {
    func printCar(car:Car) {
        print("BMW")
    }
}
class CarFactory {
    func createCar(eCar: ECar) -> Factory? {
        switch eCar{
            case .audi:
                return Audi()
            case .bmw:
                return BMW()
            default:
                return nil
        }
    }
}
public class MainFactory {
    public init() {}
    
    var audiExample = Car(brand: "A6", model: "Black")
    var audiCar = CarFactory().createCar(eCar: .audi)
    
    var bmwExample = Car(brand: "118i", model: "Red")
    var bmwCar = CarFactory().createCar(eCar: .bmw)
    
    public func callFactory() {
        self.audiCar!.printCar(car: audiExample)
        self.bmwCar!.printCar(car: bmwExample)
    }
}

