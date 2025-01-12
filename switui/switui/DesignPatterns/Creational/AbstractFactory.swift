//
//  AbstractFactory.swift
//  switui
//
//  Created by Abdur Rahim on 12/01/25.
//

import Foundation

//Abstarct Product
protocol Order {
    var orderName:String{ get }
    func acceptOrder()
    func preparedOrder()
    func thankForOrder()
}
//Concrete Product
class LemonSoda:Order {
    var orderName: String
    init() {
        orderName = "Lemon Soda"
        acceptOrder()
        preparedOrder()
        thankForOrder()
    }
    
    func acceptOrder() {
        print("Your \(orderName) is being prepared")
    }
    
    func preparedOrder() {
        print("Your \(orderName) is ready")
    }
    
    func thankForOrder() {
        print("Thank you for your order. Enjoy your \(orderName)")
    }
}
//Concrete Product
class CheeseBerger:Order {
    var orderName: String
    init() {
        orderName = "Cheese burger"
        acceptOrder()
        preparedOrder()
        thankForOrder()
    }
    
    func acceptOrder() {
        print("Your \(orderName) is being prepared")
    }
    
    func preparedOrder() {
        print("Your \(orderName) is ready")
    }
    
    func thankForOrder() {
        print("Thank you for your order. Enjoy your \(orderName)")
    }
}
//Concrete Product
class FrenchFries:Order {
    var orderName: String
    init() {
        orderName = "French Fries"
        acceptOrder()
        preparedOrder()
        thankForOrder()
    }
    
    func acceptOrder() {
        print("Your \(orderName) is being prepared")
    }
    
    func preparedOrder() {
        print("Your \(orderName) is ready")
    }
    
    func thankForOrder() {
        print("Thank you for your order. Enjoy your \(orderName)")
    }
}
//Concrete Product
class MargheritaPizza:Order {
    var orderName: String
    init() {
        orderName = "Margherita Pizza"
        acceptOrder()
        preparedOrder()
        thankForOrder()
    }
    
    func acceptOrder() {
        print("Your \(orderName) is being prepared")
    }
    
    func preparedOrder() {
        print("Your \(orderName) is ready")
    }
    
    func thankForOrder() {
        print("Thank you for your order. Enjoy your \(orderName)")
    }
}
// Abstract Factory
protocol OrderFactory {
    func createOrder() -> Order
}
// Client
enum OrderItem{
    case LemonSoda, MargharitaPizza, CheeseBurger, FrenchFries
}

//Abstarct Factory
class CheeseBurgerFactory: OrderFactory {
    func createOrder() -> Order {
        return CheeseBerger()
    }
}
//Abstarct Factory
class LemonSodaFactory: OrderFactory {
    func createOrder() -> Order {
        return LemonSoda()
    }
}
// Abstarct Factory
class FrenchFriesFactory: OrderFactory {
    func createOrder() -> Order {
        return FrenchFries()
    }
}

// Abstarct Factory
class MargheritaPizzaFactory: OrderFactory {
    func createOrder() -> Order {
        return MargheritaPizza()
    }
}

class Client {
    var clientName: String
    var orderItem:OrderItem
    var orderFactory:OrderFactory
    init(clientName: String, orderItem: OrderItem) {
        self.clientName = clientName
        self.orderItem = orderItem
        switch orderItem {
            case .CheeseBurger:
                self.orderFactory = CheeseBurgerFactory()
            case .LemonSoda:
                self.orderFactory = LemonSodaFactory()
            case .MargharitaPizza:
                self.orderFactory = MargheritaPizzaFactory()
            case .FrenchFries:
                self.orderFactory = FrenchFriesFactory()
        }
    }
    
    func startOrder() -> Order {
        print("Welcome, \(clientName)")
        return orderFactory.createOrder()
    }
}


