//
//  ObserverPattern.swift
//  switui
//
//  Created by Abdur Rahim on 15/01/25.
//


/*
 Components of the Observer Pattern
 Subject (Observable): The object that maintains the list of observers and provides methods to add, remove, and notify them. The subject typically notifies all its registered observers when its state changes.
 Observer: The objects that depend on the subject. These objects register themselves with the subject to receive updates about the subject’s state changes.
 Concrete Subject: A subclass of the Subject. It stores the state that needs to be shared with the observers and sends notifications to observers when that state changes.
 Concrete Observer: A subclass of the Observer. It implements the update mechanism to receive and respond to state changes in the subject.
 
 Advantages of the Observer Pattern
 Loose Coupling: The subject and observers are loosely coupled. The subject doesn’t need to know about the specifics of each observer, just that they implement the Observer interface. The observers don't need to know about the details of the subject either. This promotes high flexibility and maintainability.
 Dynamic Subscription: Observers can be added or removed at runtime. For example, you can dynamically attach new devices to the weather station or remove them as needed.
 Automatic Updates: Observers are automatically updated when the subject’s state changes. This eliminates the need for polling or manually triggering updates, reducing potential errors and redundant code.
 Separation of Concerns: The observer pattern allows different parts of the system to handle their specific responsibilities (e.g., gathering weather data, displaying weather information, sending notifications) without tightly coupling them together.
 Extendable: You can easily add new observers without modifying the existing code. New devices (observers) can be integrated with minimal changes to the system.
 
 
 Disadvantages of the Observer Pattern
 Memory Leaks: If observers are not properly removed from the subject, you might experience memory leaks. If the observer is not deregistered before it is discarded, it will still be notified, leading to unnecessary notifications and memory consumption.
 Performance Issues: If the number of observers becomes very large, the system might encounter performance issues as each state change in the subject triggers a notification to every observer.
 Complexity in Handling Circular Dependencies: If an observer modifies the state of the subject or other observers (circular dependencies), it may lead to an unintended cascade of updates. This can become difficult to manage, especially in complex systems.
 Unnecessary Notifications: If not managed carefully, some observers may receive updates that are not needed or relevant to them, leading to unnecessary work.
 Difficulty in Debugging: Since observers are decoupled from the subject, it can sometimes be hard to track and debug the flow of updates, especially in a large system with many observers.
 
 
 Use Cases for the Observer Pattern
 Real-Time Systems: Systems that require real-time updates, such as weather monitoring systems, stock market apps, or news feeds, are prime candidates for the observer pattern. In such systems, multiple clients need to be notified of changes without the clients needing to check for updates constantly.
 Event Handling: In GUI (Graphical User Interface) applications, button clicks, mouse movements, or keyboard presses can be treated as events. Different components of the application can observe and respond to these events.
 Distributed Systems: In systems where the state of a central server or system must be propagated to multiple clients (e.g., online games, chat applications, or live dashboards), the observer pattern can efficiently manage communication between the server and clients.
 Messaging Systems: Email clients or messaging apps that need to notify multiple users of a new message or update are good examples of the observer pattern. For instance, when a new message arrives, all interested users (observers) should be notified.
 Publish/Subscribe Systems: Many notification or messaging services (e.g., newsletters, notification systems, or event buses) use the observer pattern. Publishers (subjects) send messages to all subscribed users (observers).
 Model-View-Controller (MVC) Design: The observer pattern is often used in the View layer of MVC systems. The Model serves as the subject, and the View is an observer that updates itself whenever the model changes.
 */
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
