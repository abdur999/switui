//
//  MementoPattern.swift
//  switui
//
//  Created by Abdur Rahim on 15/01/25.
//

import Foundation

/*
 Memento pattern captures the internal state of an object and allows it to be restored later.
 Example: Undo Operation
 */
class Editor {
    private var content:String = ""
    
    func type(text:String) {
        content += text
    }
    func getContent()-> String {
        return content
    }
    func save() -> Memento {
        return Memento(state: content)
    }
    func restore(memento: Memento) {
        content = memento.state
    }
}
class Memento{
    let state:String
    init(state: String) {
        self.state = state
    }
}
