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
        
        composite()
        
        facade()
        
        flyweight()
        
        proxy()
        
        chainOFResponsibility()
        
        command()
        
        iterator()
        
        mediator()
        
        observer()
        
        bridgePattern()
        
        state()
        
        srp()
        
        ocp()
        
        lsp()
        
        
    
        
    }
    //MARK: Factory creational Pattern
    func Factory() {
        print("**** -- Factory Pattern Started -- ****")
        MainFactory().callFactory()
    }
    //MARK: AbstractFactory creational Pattern
    func AbstarctFactory() {
        print("**** -- Abstarct Factory Pattern Started -- ****")
        let client = Client(clientName: "Jim", orderItem: .MargharitaPizza)
        client.startOrder()
        let client2 = Client(clientName: "Deepa", orderItem: .LemonSoda)
        client2.startOrder()
        let client3 = Client(clientName: "Selina", orderItem: .CheeseBurger)
        client3.startOrder()
        let client4 = Client(clientName: "rajesh", orderItem: .FrenchFries)
        client4.startOrder()
    }
    //MARK: Prototype creational Pattern
    func prototype() {
        print("**** -- Prototype Pattern Started -- ****")
        let prototype = AddressPrototype(title: "Home", phone: "8177570945", city: "Kolkata")
        var homeAddress = prototype.clone()
        homeAddress.printAddress()
        
        var workAddress = prototype.clone()
        workAddress.title = "Work"
        workAddress.printAddress()
    }
    //MARK: Builder creational Pattern
    //Builder Pattern added here
    func biulder() {
        print("**** -- Builder Pattern Started -- ****")
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
    //MARK: Adapter structural Pattern
    func  adapterPattern() {
        print("**** -- Adapter Pattern Started -- ****")
        //Usage
        let apiResponse = WeatherAPIResponse(tempareture: 22.5, humidity: 65.0)
        let adapter = WeatherAdapter()
        let weather = adapter.adapt(response: apiResponse)
        print("Weather tempareture is \(weather.temp)")
    }
    //MARK: Bridge structural Pattern
    func bridgePattern() {
        print("**** -- Bridge Pattern Started -- ****")
        let creditCardPayment = PaymentProcesor(paymentMethod: CreditCardPay())
        creditCardPayment.pay(amount: 50.0)
        
        let payPaldPayment = PaymentProcesor(paymentMethod: PayPalPay())
        payPaldPayment.pay(amount: 50.0)
        
    }
    //MARK: Composite structural Pattern
    func composite() {
        print("**** -- Composite Pattern Started -- ****")
        let button = UButton()
        let label = ULabel()
        let stack = UStack()
        stack.add(button)
        stack.add(label)
        stack.render()
    }
    //MARK: Decorator structural Pattern
    func decorator()  {
        print("**** -- Decorator Pattern Started -- ****")
        let myCofee = Cofee()
        let myCofeeWithMilk = MilkDecorator(drink: myCofee)
        let myCofeeWithMilkAndSugar = SugarDecorator(drink: myCofeeWithMilk)
        
        print("Cost of cofee: \(myCofee.cost())")
        print("Cost of cofee with milk: \(myCofeeWithMilk.cost())")
        print("Cost of cofee with milk and sugar: \(myCofeeWithMilkAndSugar.cost())")
    }
    //MARK: Facade structural Pattern
    func facade() {
        print("**** -- Facade Pattern Started -- ****")
        let filefacade = FileFacade()
        filefacade.processFile(filename: "example.txt", content: "Hello World")
    }
    //MARK: Flyweight structural Pattern
    func flyweight() {
        print("**** -- Flyweight Pattern Started -- ****")
        let factory = TextFormatFactory()
        let format1 = factory.getFormat(font: "Arial", fontSize: 12)
        let format2 = factory.getFormat(font: "Arial Black", fontSize: 12)
        let format3 = factory.getFormat(font: "Times New Roman", fontSize: 18)
        let format4 = factory.getFormat(font: "Arial", fontSize: 12)
        print("flyweight")
        print(format1 === format2)
        print(format1 === format4)
    }
    //MARK: Proxy structural Pattern
    func proxy() {
        //Usage
        print("**** -- proxy Pattern Started -- ****")
        let proxy = CaachingProxy()
        print(proxy.fetchData()) // Fetches from server
        print(proxy.fetchData()) // Return from cached data
    }
    //MARK: ChainOfResponsibility Behavioral Pattern
    func chainOFResponsibility() {
        print("**** -- ChainOfResponsibility Pattern Started -- ****")
        let consoleLogger = ConsoleLoggerY()
        let fileLogger = FileLoggerY()
        let emailLogger = EmailLoggerY()
        
        consoleLogger.nextLogger = fileLogger
        fileLogger.nextLogger = emailLogger
        consoleLogger.log(message: "This is a test log")
        consoleLogger.nextLogger?.log(message: "This is test log from other source")
    }
    
    //MARK: Command Behavioral Pattern
    func command() {
        print("**** -- Command Pattern Started -- ****")
        //Usage
        let light = Light()
        let lightOn = LightOnCommand(light: light)
        let lightOff = LightOffCommand(light: light)
        
        let remote = RemoteControl()
        remote.setCommand(command: lightOn)
        remote.pressButton()
        
        remote.setCommand(command: lightOff)
        remote.pressButton()
    }
    //MARK: Interpreter Behavioral Pattern
    func interpreter() {
        print("**** -- Interpreter Pattern Started -- ****")
        let five = NumberExpression(number: 5)
        let ten = NumberExpression(number: 10)
        
        let addExpression = AddExpression(left: five, right: ten)
        let result = addExpression.interpret()
        print("Intrepreter result \(result)")
    }
    //MARK: Iterator Behavioral Pattern
    func iterator() {
        print("**** -- Iterator Pattern Started -- ****")
        let numbers = [1,2,3,4,5]
        let iterator = ArrayIteratorU(array: numbers)
        while iterator.hasNext() {
            if let number = iterator.next() {
                print(number)
            }
        }
    }
    //MARK: Mediator Behavioral Pattern
    func mediator() {
        print("**** -- Mediator Pattern Started -- ****")
        let chatRoom = ChatRoom()
        let user1 = Userx(name: "Alice")
        let user2 = Userx(name: "Bob")
        
        user1.joinChat(chatRoom: chatRoom)
        user2.joinChat(chatRoom: chatRoom)
        
        user1.sendMessage(message: "Hello Bob!")
        user2.sendMessage(message: "Hi Alice!")
    }
    //MARK: Memento Behavioral Pattern
    func memento() {
        print("**** -- Memento Pattern Started -- ****")
        let editor = Editor()
        editor.type(text: "Hello")
        editor.type(text: "World!")
        
        let savedState = editor.save()
        
        editor.type(text: "GoodBye!")
        print(editor.getContent())
        
        editor.restore(memento: savedState)
        print(editor.getContent())
    }
    //MARK: Observer Behavioral Pattern
    func observer() {
        print("**** -- Observer Pattern Started -- ****")
        let weatherStation = WeatherStation()
        let phoneDisplay = PhoneDisplay()
        let desktopDisplay = DesktopDisplay()
        
        weatherStation.addObserver(observer: phoneDisplay)
        weatherStation.addObserver(observer: desktopDisplay)
        
        weatherStation.setTempareture(tempareture: 25.0)
    }
    //MARK: State Behavioral Pattern
    func state() {
        print("**** -- State Behavioral Pattern added -- ****")
        //Create a vending machine with 2 products in stock
        let vendingMachine = VendingMachine(initialStock: 2)
        
        //Test the vending machine states
        vendingMachine.selectProduct() //No money inserted
        vendingMachine.insertCoin()     //Insert coin
        vendingMachine.selectProduct()  //Select product and dispense
        
        vendingMachine.insertCoin() //Insert money
        vendingMachine.selectProduct()  //Select product and dispose
        
        vendingMachine.insertCoin()     //Attempt to insert money when out of stock
        vendingMachine.selectProduct()      //Attempt to select product when out of stock
        
    }
    //MARK: Strategy Behavioral Pattern
    func strategy() {
        print("**** -- Strategy Behavioral Pattern added -- ****")
        let quickSort = QuickSort()
        let mergeSort = MergeSort()
        
        let context = Context(strategy: quickSort)
        print(context.executeSort(array: [3,2,5,1,4]))
        
        context.setStrategy(strategy: mergeSort)
        print(context.executeSort(array: [3,2,5,1,4]))
    }
    //MARK: Template Behavioral Pattern
    func template() {
        let chess = Chess()
        chess.play()
        
        let soccer = Soccer()
        soccer.play()
    }
    // Single Responsibility Principle
    func srp() {
        print("**** -- Single Responsibility Principle Started -- ****")
        let emaiService = EmailService()
        let userManager = UserManagerAccurate(emailService: emaiService)
        
        let user = Usr(id: 1, name: "John Doe", email: "Johndoe@gmail.com")
        userManager.saveUser(user)
    }
    // Open/Closed Principle
    func ocp() {
        print("**** -- Open/Closed Principle Started -- ****")
        let creditCardPayment = CreditCardPayemnt()
        let payPalPayment = PayPalPayemnt()
        
        let creditCardProcessor = PaymentMethodProcessor(paymentMethod: creditCardPayment)
        creditCardProcessor.processPayemnt(amount: 100.0)
        
        let payPalProcessor = PaymentMethodProcessor(paymentMethod: payPalPayment)
        payPalProcessor.processPayemnt(amount: 200.0)
    }
    // Liskov Substitution Principle
    func lsp(){
        print("**** -- Liskov Substitution Principle Started -- ****")
        let rectanglex = RectangleX(width: 5, height: 4)
        AreaCalculator().printArea(of: rectanglex)
        
        let squarex = SquareX(side: 4)
        AreaCalculator().printArea(of: squarex)
    }
    // Dependency Inversion Principle
    func di() {
        print("**** -- Dependency Inversion Principle Started -- ****")
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
