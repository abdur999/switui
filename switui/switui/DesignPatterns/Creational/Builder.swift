//
//  Builder.swift
//  switui
//
//  Created by Abdur Rahim on 13/01/25.
//

import Foundation


//Benefit of Builder
/*
 1. Clearer code: simplifies the creation of complex objects
 2. Reusability: Allows reuse of specific builders for different configurations.
 3. flexibility: Easily add or modify steps without affecting existing code
 */
public class Pizza {
    var size:String = ""
    var crust:String = ""
    var cheese: String = ""
    var toppings: [String] = []
    func description() -> String {
        return """
        Pizza Details:
        Size: \(size)
        Crust: \(crust)
        Cheese: \(cheese)
        Toppings: \(toppings.joined(separator: ", "))
        """
    }
    
}
protocol PizzaBuilder{
    func setSize(_ size:String) -> PizzaBuilder
    func setCrust(_ crust:String) -> PizzaBuilder
    func setCheese(_ cheese:String) -> PizzaBuilder
    func addTopings(_ topping:String) -> PizzaBuilder
    func build() -> Pizza
}
class CustomPizzaBuilder: PizzaBuilder {
    func setSize(_ size: String) -> PizzaBuilder {
        pizza.size = size
        return self
    }
    
    func setCrust(_ crust: String) -> PizzaBuilder {
        pizza.crust = crust
        return self
    }
    
    func setCheese(_ size: String) -> PizzaBuilder {
        pizza.size = size
        return self
    }
    
    func addTopings(_ topping: String) -> PizzaBuilder {
        pizza.toppings.append(topping)
        return self
    }
    
    func build() -> Pizza {
        let finishPizza = pizza //Reset for the next build
        pizza = Pizza()
        return finishPizza
    }
    
    private var pizza = Pizza()
}



class PizzaDirector {
    private var builder: PizzaBuilder
    init(builder: PizzaBuilder) {
        self.builder = builder
    }
    func createClassicPizza() -> Pizza {
        return builder
            .setSize("Large")
            .setCrust("Thick")
            .setCheese("Cheddar")
            .addTopings("Mushrooms")
            .addTopings("Rell Peppers")
            .addTopings("Onions")
            .build()
    }
    func createVegetarianPizza() -> Pizza {
        return builder
            .setSize("Medium")
            .setCrust("Thin")
            .setCheese("Mozarella")
            .addTopings("Pepproni")
            .addTopings("Olives")
            .build()
    }
}
