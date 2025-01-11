//
//  Associated.swift
//  switui
//
//  Created by Abdur Rahim on 11/01/25.
//

import Foundation

//Protocol can define associated types that  act as placeholders for types until the protocol is adopted
protocol Container {
    associatedtype Item
    var items:[Item] { get set }
    mutating func add(item:Item)
}

struct Box:Container {
    var items: [String]
    
    mutating func add(item: String) {
        items.append(item)
    }
}
