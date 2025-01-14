//
//  swituiApp.swift
//  switui
//
//  Created by Abdur Rahim on 21/12/24.
//

import SwiftUI

@main
struct swituiApp: App {
    init() {
        // Protocol ExistentialType
        let exe = ExistentialType()
        let animal = exe.getAnimal(type: .anonymus)
        let sound = animal.makeSound()
        print(sound)
        
        //Protocol Associated type
        var box = Box(items: [])
        box.add(item: "box1")
        print(box.items)
        var box1 = BoxInt(items: [2])
        box1.add(item: 1)
        print(box1.items)
       
        //Protocol and opaque type
        let shape = craeteShapeCircle(isLarge: true)
        print(shape.draw())
        
        let  account1 = BankAccount()
        let  account2 = BankAccount()
        Task{
            
            await account1.deposit(amount:100)
            print("Balance from account1: \(await account1.getBalance())")
            await account2.deposit(amount:1000)
            await account1.copyScore(from: account2)
            print("Balance from account1 after update: \(await account1.getBalance())")
            await account2.deposit(amount:-100)
            print("Balance of account2 after deduction : \(await account2.getBalance())")
            print("Account number after masking \(account2.getMaskedAccountNumber())")
        }
        
        Factory()
        
        AbstarctFactory()
        
        prototype()
        
        adapterPattern()
        
        srp()
        
        ocp()
        
        lsp()
        
        
    bridgePattern()
        
    }
    func Factory() {
        MainFactory().callFactory()
    }
    func AbstarctFactory() {
        let client = Client(clientName: "Jim", orderItem: .MargharitaPizza)
        client.startOrder()
        let client2 = Client(clientName: "Deepa", orderItem: .LemonSoda)
        client2.startOrder()
        let client3 = Client(clientName: "Selina", orderItem: .CheeseBurger)
        client3.startOrder()
        let client4 = Client(clientName: "rajesh", orderItem: .FrenchFries)
        client4.startOrder()
    }
    func prototype() {
        let prototype = AddressPrototype(title: "Home", phone: "8177570945", city: "Kolkata")
        var homeAddress = prototype.clone()
        homeAddress.printAddress()
        
        var workAddress = prototype.clone()
        workAddress.title = "Work"
        workAddress.printAddress()
    }
    //Builder Pattern added here
    func biulder() {
        let builder = CustomPizzaBuilder()
        //build pizza Manually
        let customPizza = builder
            .setSize("Small")
            .setCrust("thick")
            .setCheese("Mozzarella")
            .addTopings("Tomatoes")
            .addTopings("Basil")
            .build()
        print(customPizza.description())
        
        //Use Director to build pre-defined pizzas
        let director = PizzaDirector(builder: builder)
        
        let classicPizza = director.createClassicPizza()
        print(classicPizza.description())
        
        let vegetarianPizza = director.createVegetarianPizza()
        print(vegetarianPizza.description())
    }
    func  adapterPattern() {
        //Usage
        let apiResponse = WeatherAPIResponse(tempareture: 22.5, humidity: 65.0)
        let adapter = WeatherAdapter()
        let weather = adapter.adapt(response: apiResponse)
        print("Weather tempareture is \(weather.temp)")
    }
    func bridgePattern() {
        let creditCardPayment = PaymentProcesor(paymentMethod: CreditCardPay())
        creditCardPayment.pay(amount: 50.0)
        
        let payPaldPayment = PaymentProcesor(paymentMethod: PayPalPay())
        payPaldPayment.pay(amount: 50.0)
        
    }
    // Single Responsibility Principle
    func srp() {
        let emaiService = EmailService()
        let userManager = UserManagerAccurate(emailService: emaiService)
        
        let user = Usr(id: 1, name: "John Doe", email: "Johndoe@gmail.com")
        userManager.saveUser(user)
    }
    // Open/Closed Principle
    func ocp() {
        let creditCardPayment = CreditCardPayemnt()
        let payPalPayment = PayPalPayemnt()
        
        let creditCardProcessor = PaymentMethodProcessor(paymentMethod: creditCardPayment)
        creditCardProcessor.processPayemnt(amount: 100.0)
        
        let payPalProcessor = PaymentMethodProcessor(paymentMethod: payPalPayment)
        payPalProcessor.processPayemnt(amount: 200.0)
    }
    // Liskov Substitution Principle
    func lsp(){
        let rectanglex = RectangleX(width: 5, height: 4)
        AreaCalculator().printArea(of: rectanglex)
        
        let squarex = SquareX(side: 4)
        AreaCalculator().printArea(of: squarex)
    }
    // Dependency Inversion Principle
    func di() {
        let consoleLogger = ConsoleLoggerx()
        let appWithConsoleLogger = Applicationx(logger: consoleLogger)
        appWithConsoleLogger.performTask()
        
        let fileLogger = FileLoggerx()
        let appWithFileogger = Applicationx(logger: fileLogger)
        appWithFileogger.performTask()
        
    }
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            BookListView()
//                .modelContainer(for:[Book.self])
            GridView()
            
            let _ = { // When to use plain non ui code we need to handle it in this way
                print("BAlance:")
            }
        }
    }
}
