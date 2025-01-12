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
