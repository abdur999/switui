//
//  ChainResponsibility.swift
//  switui
//
//  Created by Abdur Rahim on 15/01/25.
//

import Foundation

protocol LoggerY {
    var nextLogger: LoggerY? {get set}
    func log(message:String)
}
class ConsoleLoggerY: LoggerY {
    var nextLogger: LoggerY?
    func log(message: String) {
        print("Console Logger \(message)")
    }
}
class FileLoggerY: LoggerY {
    var nextLogger: LoggerY?
    func log(message: String) {
        print("File Logger \(message)")
    }
}
class EmailLoggerY: LoggerY {
    var nextLogger: LoggerY?
    func log(message: String) {
        print("Console Logger \(message)")
    }
}
