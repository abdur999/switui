//
//  Post.swift
//  switui
//
//  Created by Abdur Rahim on 21/12/24.
//

import Foundation

struct Post: Identifiable, Codable, Hashable {
    let id: Int
    let title: String
    let body: String
}
