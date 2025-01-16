//
//  Template.swift
//  switui
//
//  Created by Abdur Rahim on 16/01/25.
//

/*
 Structure of Template Method Pattern
Abstract Class (Template): This contains the template method that defines the sequence of steps in the algorithm. The template method calls abstract methods (that are implemented by concrete subclasses) to allow for customization.
Concrete Class: Subclasses that provide specific implementations for the abstract methods in the template.
 */

/*
 Real-World Example: Document Processing
 Let's say we are working with different types of documents and need to implement a processing flow for each type. Each document might require different steps, but the overall flow (such as opening the document, reading it, and closing it) remains the same.
 */
/*
 Key Points:
 Template Method: The process method in the Document class is the template method. It defines the sequence of steps for document processing. The exact steps (open, read, close) are implemented by the subclasses.
 Common Algorithm: The algorithm (open → read → close) is shared among all document types, and only the details of each step are customized by the subclasses.
 Abstraction: Common behavior (like the order of operations) is defined in the abstract base class, reducing the need for repetition in each concrete class.
 Benefits of the Template Method Pattern:
 Code Reusability: Common steps are defined once in the base class, reducing duplication.
 Control Over the Algorithm: The template method defines the structure and order of operations, ensuring consistency across subclasses.
 Flexibility and Customization: Subclasses can provide their own implementation for specific steps without changing the overall algorithm.
 Extensibility: If you want to add new document types, you only need to implement the specific steps (open, read, close) for that document type, without needing to repeat the common process.
 */
/*
 Practical Uses of the Template Method Pattern
 File Parsing: If you're building a system that needs to read and process different types of files (CSV, JSON, XML), the Template Method pattern can ensure that the reading and processing steps follow the same order, but the actual reading logic can differ for each file type.
 Data Import and Export: If you have multiple types of data export or import operations (e.g., CSV export, JSON export, XML export), you can use the Template Method to define the sequence of actions (e.g., open file → write header → write data → close file) while allowing subclasses to implement specific export logic.
 Game Loop: In games, there’s often a standard sequence of steps (initialize → process input → update game state → render). The Template Method pattern can be used to ensure these steps happen in the correct order while allowing for customized logic in each game subclass.
 */
import Foundation

class Game {
    func play() {
        start()
        playTurn()
        end()
    }
    func start() {
       print("Starting the game")
    }
    func playTurn(){
        fatalError("Subclass must implement this method game")
    }
    func end(){
        print("Ending the game")
    }
}
class Chess:Game{
    override func playTurn(){
        print("Playing turn of chess  game")
    }
}
class Soccer:Game{
    override func playTurn(){
        print("Playing turn of chess  game")
    }
}

