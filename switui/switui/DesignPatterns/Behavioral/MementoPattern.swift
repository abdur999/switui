//
//  MementoPattern.swift
//  switui
//
//  Created by Abdur Rahim on 15/01/25.
//


/*
 Components of the Memento Pattern

 Originator: This is the object whose state is to be saved. The Originator creates a Memento containing a snapshot of its internal state and uses the Memento to restore its previous state when necessary.
 Memento: This object stores the internal state of the Originator object. The Memento has two main roles:
 Storage: It encapsulates the state of the Originator.
 Access control: The Memento object should only expose the information necessary to restore the state to the Originator. The internal state remains hidden from the external world, maintaining encapsulation.
 Caretaker: This is the object responsible for keeping the Memento. It does not modify or interact directly with the state stored in the Memento; it only stores and retrieves it when required. The Caretaker can store multiple Mementos if needed, to facilitate multiple undo/redo operations or state history tracking.
 
 Practical Use Cases of the Memento Pattern
 Undo/Redo Operations:
 The most common use case for the Memento pattern is implementing undo and redo functionality in applications like text editors, graphic design software, or version control systems.
 In a text editor, each time a user types a character, a Memento object is created to capture the current text. If the user wants to undo the typing action, the text can be restored from the Memento object.
 State Management:
 Video games use the Memento pattern to allow players to save their game state (progress, health, score, etc.) and later restore it. This allows players to pause and resume the game, or go back to a previous checkpoint.
 Transaction History:
 In financial or transaction-based applications, the Memento pattern can be used to capture the state of transactions or account balances at specific points in time. This allows for easy rollback or reversal of transactions.
 State-based System:
 Applications dealing with complex workflows (e.g., order processing systems or task management systems) may need to save intermediate states to allow for easy recovery or audit tracking.
 
 Advantages of Memento Pattern
 Encapsulation Preservation:
 Since the internal state of an object is encapsulated in the Memento and not directly accessible to external classes, the Memento pattern respects the principle of encapsulation.
 Ease of State Restoration:
 The Memento pattern allows for the easy restoration of an object's state. By simply storing and later retrieving the Memento, developers can effectively undo or revert an object to a previous state.
 Separation of Concerns:
 The pattern allows the Originator (the object whose state is being saved) to focus solely on its internal logic and behavior, while the Caretaker is responsible for managing the state, leading to a cleaner and more maintainable design.
 Supports Undo/Redo Operations:
 Memento is ideal for systems that require frequent state manipulation, especially when users need to perform undo or redo operations. It allows multiple "snapshots" of an object's state, making it easy to revert to any prior state.
 
 Disadvantages of Memento Pattern
 Memory Overhead:
 Storing multiple Mementos (e.g., during an undo/redo operation) can result in high memory consumption, especially if the object's state is large or if there are many snapshots taken over time.
 Complexity in State Management:
 Managing the state history of an object can introduce complexity in your system, especially if you need to handle multiple versions of an object's state or support deep cloning of complex objects.
 Lack of Granularity:
 The Memento pattern generally captures the entire state of the object, which may be unnecessary if only part of the state is required. This could lead to inefficiencies, as all data is stored even when only a small portion is needed for restoration.
 
 Explanation of the Example:
 TextEditor (Originator) contains the state (text), and provides methods for writing text, saving the current state, and restoring the state.
 Memento stores the text's state at a given moment in time.
 History (Caretaker) manages the history of Mementos and provides methods to undo and redo.
 When the user writes text, the text editor’s state is saved to a Memento object. The History class keeps track of the Mementos, allowing the user to undo and redo their actions.
 
 */
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
