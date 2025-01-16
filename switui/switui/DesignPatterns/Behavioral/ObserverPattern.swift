//
//  ObserverPattern.swift
//  switui
//
//  Created by Abdur Rahim on 15/01/25.
//

import Foundation

/*
 Observer pattern allows objects(observers) to subscribe to an event or change in anotherobject(subject). When the subject changes, all observers notified
 Example :- WeatherUpdate
 */
protocol Observer:AnyObject {
    func update(tempareture:Double)
}
class WeatherStation {
    private var observers : [Observer] = []
    private var tempareture : Double = 0.0
    func addObserver(observer:Observer) {
        observers.append(observer)
    }
    func removeObserver(observer:Observer) {
        observers = observers.filter { $0 !== observer }
    }
    func setTempareture(tempareture:Double) {
        self.tempareture = tempareture
        notifyObservers()
    }
    private func notifyObservers() {
        for observer in observers {
            observer.update(tempareture: tempareture)
        }
    }
}
class PhoneDisplay : Observer{
    func update(tempareture: Double) {
        print("Phone Display: Current tempareturn is \(tempareture) C")
    }
}
class DesktopDisplay : Observer{
    func update(tempareture: Double) {
        print("Desktop Display: Current tempareturn is \(tempareture) C")
    }
}
