//
//  Facade.swift
//  switui
//
//  Created by Abdur Rahim on 14/01/25.
//

import Foundation

/*
 The facade paatern provides a simplified interface to a complex subsystem. It hides the complexity of the system and provides an easier way to inteact with it
 */
class FileReader {
    func readFile(filename: String) {
        print("Reading file: \(filename)")
    }
}
class FileWriter {
    func writeFile(filename: String, content:String) {
        print("Writing to file: \(filename) with content\(content)")
    }
}
class FileFacade {
    private let reader = FileReader()
    private let writer = FileWriter()
    func processFile(filename:String, content:String){
        reader.readFile(filename: filename)
        writer.writeFile(filename: filename, content: content)
    }
}

