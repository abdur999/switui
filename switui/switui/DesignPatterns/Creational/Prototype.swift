//
//  Prototype.swift
//  switui
//
//  Created by Abdur Rahim on 13/01/25.
//

import Foundation

public class AddressPrototype {
    public var title: String
    public var phone: String
    public var city:String
    public init(title: String, phone: String, city: String) {
        self.title = title
        self.phone = phone
        self.city = city
    }
    //clone with same parameter and change according to your requirement to change particular variable value
    public func clone() -> AddressPrototype {
        return AddressPrototype(title: title, phone: phone, city: city)
    }
    public func printAddress() {
        return print("Address title: \(title), Phone: \(phone), City: \(city)")
    }
}
