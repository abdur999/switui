//
//  CommandPattern.swift
//  switui
//
//  Created by Abdur Rahim on 15/01/25.
//

import Foundation

//Command Protocol
protocol Command {
    func execute()
}

class Light {
    func turnOn() {
        print("The light is ON")
    }
    func turnOff() {
        print("The light is OFF")
    }
}

//Concrete command for turning the light on
class LightOnCommand: Command {
    private let light:Light
    init(light: Light) {
        self.light = light
    }
    func execute() {
        light.turnOn()
    }
}


//Concrete command for turning the light off
class LightOffCommand: Command {
    private let light:Light
    init(light: Light) {
        self.light = light
    }
    func execute() {
        light.turnOff()
    }
}

//Invoker
class RemoteControl {
    private var command: Command?
    func setCommand(command:Command) {
        self.command = command
    }
    func pressButton() {
        command?.execute()
    }
}
