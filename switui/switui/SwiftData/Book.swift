//
//  Person.swift
//  switui
//
//  Created by Abdur Rahim on 26/12/24.
//

import Foundation
import SwiftData

@Model
class Book {
  var title: String
  var author: String
  var publisher: String
  var summary: String
  
  init(title: String, author: String, publisher: String, summary: String = .empty) {
    self.title = title
    self.author = author
    self.publisher = publisher
    self.summary = summary
  }
}

