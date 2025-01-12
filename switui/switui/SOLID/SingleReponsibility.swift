//
//  SingleReponsibility.swift
//  switui
//
//  Created by Abdur Rahim on 12/01/25.
//

import Foundation

struct Usr {
    let id:Int
    let name:String
    let email:String
}

// Bad design principle violate Single Responsibility Principle

/*

 SRP states that class should have one and only one reason to change. this principle ensures that a class has single responsibility, making it easier to maintain and extend
 
 */

/*
 UserManager class have two responsibility 1. Save user 2. Send email
 Any changes to email sending logic would affect this class, viloating SRP(Single Responsibility Principle)
 */
class UserManager {
    func saveUser(_ user : Usr) {
        print("User saved to database")
    }
    func sendWelocomeEmail(_ user:Usr) {
        print("welcome email sent to \(user.email)")
    }
}

// Good design principle abide Single Responsibility Principle
//Reponsible for managing user-related operations
/*
 
 Benefits
 1. Seperation of concerns: the UserManager class only manages user related operations, while the EmailService handle email logic
 2. Ease of Maintenance: Change to email-sending logic won't affect the user management logic
 3. Testability: Each class can be tested independently, simplifying unit tests
 */
class UserManagerAccurate {
    private let emailService: EmailService
    init(emailService: EmailService) {
        self.emailService = emailService
    }
    func saveUser(_ user : Usr) {
        print("User saved to database")
        emailService.sendWelocomeEmail(user)
    }
}

//Responsible for sending emails
class EmailService {
    func sendWelocomeEmail(_ user:Usr) {
        print("welcome email sent to \(user.email)")
    }
}
