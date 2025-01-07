//
//  NewBookView.swift
//  switui
//
//  Created by Abdur Rahim on 26/12/24.
//

import Foundation
import SwiftUI

struct NewBookView: View {
  @Environment(\.modelContext) private var context
  @Environment(\.dismiss) var dismiss
  
  @State private var title: String = .empty
  @State private var author: String = .empty
  @State private var publisher: String = .empty
  var body: some View {
    NavigationStack {
      Form {
        TextField("Book title", text: $title)
        TextField("Author of the book", text: $author)
        TextField("Book publisher", text: $publisher)
        Button("create"){
          let newBook = Book(title: title, author: author, publisher: publisher)
          context.insert(newBook)
          dismiss()
        }
        .frame(maxWidth: .infinity)
        .buttonStyle(.borderedProminent)
        .disabled(title.isEmpty || author.isEmpty || publisher.isEmpty)
        .navigationTitle("New book")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .topBarLeading){
            Button("Cancel"){
              dismiss()
            }
          }
        }
        
      }
    }
  }
}

#Preview {
  NewBookView()
}
