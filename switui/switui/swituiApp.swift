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
        let exe = ExistentialType()
        let animal = exe.getAnimal(type: .anonymus)
        let sound = animal.makeSound()
        print(sound)
        
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
