//
//  Composite.swift
//  switui
//
//  Created by Abdur Rahim on 14/01/25.
//

import Foundation

//Component protocol
protocol UIElement {
    func render()
}

//Leaf component
class UButton:UIElement {
    func render() {
        print("Rendering button")
    }
}

//Leaf component
class ULabel:UIElement {
    func render() {
        print("Rendering button")
    }
}

//Composite component
class UStack:UIElement {
    private var elements = [UIElement]()
    func add(_ elemnent:UIElement) {
        elements.append(elemnent)
    }
    func render() {
        for element in elements {
            element.render()
        }
    }
}
