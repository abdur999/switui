//
//  FlyWeight.swift
//  switui
//
//  Created by Abdur Rahim on 15/01/25.
//

import Foundation

/*
 Flyweight PAttern is used to reduce memory usage by sharing objects that are identicak in some way. It is useful when you need to manage large quantities of similar objects
 */
//Flyweight class
class TextFormat {
    let font: String
    let fontSize: Int
    init(font: String, fontSize: Int) {
        self.font = font
        self.fontSize = fontSize
    }
}

//Flyweight Factory
class TextFormatFactory {
    private var formats = [String:TextFormat]()
    func getFormat(font:String, fontSize:Int) -> TextFormat {
        let key = "\(font)- \(fontSize)"
        if let format = formats[key] {
            return format
        } else {
            let newFormat = TextFormat(font: font, fontSize: fontSize)
            formats[key] = newFormat
            return newFormat
        }
    }
}
