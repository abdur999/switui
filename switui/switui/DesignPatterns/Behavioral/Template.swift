//
//  Template.swift
//  switui
//
//  Created by Abdur Rahim on 16/01/25.
//

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

