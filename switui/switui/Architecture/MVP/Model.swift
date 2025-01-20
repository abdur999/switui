//
//  Modelm.swift
//  switui
//
//  Created by Abdur Rahim on 20/01/25.
//

import Foundation

struct PostM: Decodable {
    let id: Int
    let title: String
    let body: String
}

struct PostResponseM: Decodable {
    let posts: [PostM]
}
