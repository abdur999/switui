//
//  Mediator.swift
//  switui
//
//  Created by Abdur Rahim on 15/01/25.
//

import Foundation

/*
 The mediator pattern centralizes complex complex communication between objects into single mediator object, promoting loose coupling
 */
class Userx {
    let name:String
    private var chatRoom:ChatRoom?
    init(name: String) {
        self.name = name
    }
    func joinChat(chatRoom:ChatRoom) {
        self.chatRoom = chatRoom
    }
    func sendMessage(message:String){
        chatRoom?.showMessage(user: self, message: message)
    }
}
class ChatRoom {
    func showMessage(user:Userx, message:String) {
        print("\(user.name) : \(message)")
    }
}
