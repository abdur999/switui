//
//  BookListView.swift
//  switui
//
//  Created by Abdur Rahim on 26/12/24.
//

import SwiftData
import SwiftUI

struct BookListView: View {
  @Environment(\.modelContext) private var context
  @Query(sort: \Book.title) private var books: [Book]
    
  @State private var createNewBook = false
  
  var body: some View {
    NavigationStack{
      Group{
          if !books.isEmpty {
          List{
            ForEach(books) { book in
              NavigationLink{
                EditBookView(book: book)
              } label: {
                HStack(spacing: 16) {
                  VStack(alignment: .leading) {
                    Text(book.title).font(.title2)
                    HStack(spacing: 8) {
                      Text(book.author).foregroundStyle(.secondary)
                      Text("Books " + book.publisher).foregroundStyle(.secondary)
                    }
                  }
                }
              }
            }
            .onDelete{ indexSet in
              indexSet.forEach{ index in
                let book = books[index]
                context.delete(book)
              }
            }
          }
        }
        else {
          ContentUnavailableView("Enter your first book!!", systemImage: "book")
        }
      }
      .listStyle(.plain)
      .navigationTitle("My Books")
      .toolbar {
        Button {
          createNewBook = true
        } label: {
          Image(systemName: "plus.circle.fill")
            .imageScale(.large)
        }
      }
      .sheet(isPresented: $createNewBook) {
        NewBookView()
      }
    }
  }
}

#Preview {
  BookListView()
    .modelContainer(for: Book.self, inMemory: true)
}
