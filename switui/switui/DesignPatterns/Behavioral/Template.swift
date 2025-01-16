//
//  Template.swift
//  switui
//
//  Created by Abdur Rahim on 16/01/25.
//

/*
 Components of the Template Method Pattern:
 Abstract Class (Template): This contains the template method, which defines the skeleton of the algorithm. Some steps of the algorithm are implemented in the abstract class, while others are defined as abstract methods that must be implemented by subclasses.
 Concrete Class: The subclasses implement the abstract methods, which define the customizable steps of the algorithm.
 Template Method: The template method is the main method in the abstract class that defines the algorithm structure. It calls other methods, some of which are abstract (and thus implemented by subclasses), and others are concrete (defined in the abstract class itself).
 */

/*
 Real-World Example: Document Processing
 Let's say we are working with different types of documents and need to implement a processing flow for each type. Each document might require different steps, but the overall flow (such as opening the document, reading it, and closing it) remains the same.
 Let's imagine we are building an application for a Coffee Shop where the process of making coffee is the same for different types of coffee, but the specific steps for brewing differ between coffee types (e.g., making Espresso vs. making Cappuccino).

 We can use the Template Method pattern to define the skeleton of the coffee-making process, allowing subclasses to define specific brewing logic.
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
 Promotes Consistency: The overall flow of the algorithm (coffee-making process) remains consistent across all subclasses, but the specific behavior is customizable by overriding abstract methods.

 Disadvantages of Template Method Pattern:
 Rigid Structure: The order of steps in the algorithm is fixed in the base class, which can be restrictive if the sequence of operations needs to be changed dynamically at runtime.
 Difficulty in Extending Multiple Algorithms: If you need multiple algorithms with similar steps, the Template Method pattern might not be the best solution, as it’s designed to handle a single algorithm. For example, if two algorithms share most of the steps but differ in many ways, this pattern can become unwieldy.
 Complexity in Large Hierarchies: In large inheritance hierarchies, the Template Method pattern can make it harder to manage and understand because you might end up with a lot of base and subclass relationships.
 */
/*
 Practical Uses of the Template Method Pattern
 File Parsing: If you're building a system that needs to read and process different types of files (CSV, JSON, XML), the Template Method pattern can ensure that the reading and processing steps follow the same order, but the actual reading logic can differ for each file type.
 Data Import and Export: If you have multiple types of data export or import operations (e.g., CSV export, JSON export, XML export), you can use the Template Method to define the sequence of actions (e.g., open file → write header → write data → close file) while allowing subclasses to implement specific export logic.
 Game Loop: In games, there’s often a standard sequence of steps (initialize → process input → update game state → render). The Template Method pattern can be used to ensure these steps happen in the correct order while allowing for customized logic in each game subclass.
 
 Use Cases of Template Method Pattern:
 Data Processing Pipelines: If you have different types of data processing that follow a similar pipeline (e.g., extracting, transforming, and loading data), you can use the Template Method pattern to define the common steps and leave the specific details to subclasses.
 Game Loops: In games, the main game loop often follows a set sequence of steps: initializing, processing input, updating game state, rendering. The Template Method pattern can help to define the structure of the game loop, while allowing subclasses to define specific actions for each step.
 Report Generation: If you need to generate reports in different formats (e.g., PDF, CSV, HTML), the general report generation process (such as opening the file, writing headers, writing data, and closing the file) can be defined in a template, while the format-specific details can be handled by subclasses.
 Document Processing: If you are building a document processing system that needs to handle different types of documents (e.g., text files, PDF files, Word documents), the Template Method pattern can be used to define the overall processing workflow, while allowing subclasses to implement the specific processing logic.
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

