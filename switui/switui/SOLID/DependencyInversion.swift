//
//  DependencyInversion.swift
//  switui
//
//  Created by Abdur Rahim on 12/01/25.
//

import Foundation
// Without DI
/*
 High Level modulesshould not depend on low-level modules. Both should depend on abstractions
 Abstraction should not depend on details. Details should depend on abstractions
 */

/*
 Ral scenario
 Imagine you want to build a logging system where the application logs messages to different output types (eg: console, file, remote server)
 Without DependencyInversion
 */
class ConsoleLogger {
    func logMessage(_ message:String) {
        print("Logging to console: \(message)")
    }
}
class Application {
    private let logger = ConsoleLogger()
    func performTask() {
        logger.logMessage("Task performed successfully")
    }
}
/*
 PROBLEMS :-
 1. Tightly coupled : The application class depends directly on the ConsoleLogger class
 2. Difficult to Extend: Adding another logger (eg FileLogger) requires modifying the application class, violating the Open/closed principles
 3. Lowflexibility: Testing is harder because you cant easily mock the logging behaviour
 
 */

// With DI
//Abstraction (protocol)
protocol Logger {
    func logMessage(_ message:String)
}
//Low-level modules (concrete implementations)
class ConsoleLoggerx:Logger {
    func logMessage(_ message: String) {
        print("Logging to console: \(message)")
    }
}

class FileLoggerx:Logger {
    func logMessage(_ message: String) {
        print("Logging to file: \(message)")
    }
}

// High-level module (depends on abstraction)
class Applicationx {
    private let logger:Logger
    init(logger: Logger) {
        self.logger = logger
    }
    func performTask() {
        //Perform some task
        logger.logMessage("Task perform successfully")
    }
}

/*
 Benefits of DIP implementation
 1. Decoupling
    The application class does not depends on the specific implementations
    You acn easily switch or add new logger types without modifying the Application class
 2. Flexibility
    Testing become simpler as you can pass a mock logger for unit tests
 3. Extensibility
    New loggers (eg, RemoteLogger) can be added without changing the high level module
 */
