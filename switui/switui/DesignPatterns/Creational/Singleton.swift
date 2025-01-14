//
//  Singleton.swift
//  switui
//
//  Created by Abdur Rahim on 13/01/25.
//

import Foundation

// Initialization called only once on it entire app lifecycle
public final class PrinterObject {
    public static let shared = PrinterObject()
    private init() {
        print("Call init \(self)")
    }
    public func printSingleton() {
        print("Printing: \(self)")
    }
}
