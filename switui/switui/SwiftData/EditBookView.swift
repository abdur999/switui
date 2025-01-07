//
//  EditBookView.swift
//  switui
//
//  Created by Abdur Rahim on 26/12/24.
//

import SwiftUI

struct EditBookView: View {
  @Environment(\.dismiss) private var dismiss
  let book: Book
  
  @State private var title: String = .empty
  @State private var author: String = .empty
  @State private var publisher: String = .empty
  @State private var summary: String = .empty
  
  var body: some View {
    VStack(alignment: .leading){
      LabeledContent {
          TextField(String.empty, text: $title)
      } label: {
        Text("Title").foregroundStyle(.secondary)
      }
      LabeledContent {
        TextField(String.empty, text: $author)
      } label: {
        Text("Author").foregroundStyle(.secondary)
      }
      LabeledContent {
        TextField(String.empty, text: $publisher)
      } label: {
        Text("Publisher").foregroundStyle(.secondary)
      }
      Divider()
      Text("Summary").foregroundStyle(.secondary)
      TextEditor(text: $summary)
        .padding(5)
        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(uiColor: .tertiarySystemFill), lineWidth: 2))
    }
    .padding()
    .textFieldStyle(.roundedBorder)
    .navigationTitle(title)
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      if updated {
        Button("To update") {
          book.title = title
          book.author = author
          book.publisher = publisher
          book.summary = summary
          dismiss()
        }
        .buttonStyle(.borderedProminent)
      }
    }
    .onAppear() {
      title = book.title
      author = book.author
      publisher = book.publisher
      summary = book.summary
    }
  }
  
  var updated: Bool {
    title != book.title
    || author != book.author
    || publisher != book.publisher
    || summary != book.summary
  }
}

//#Preview {
//    EditBookView()
//}
