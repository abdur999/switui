//
//  ContentView.swift
//  switui
//
//  Created by Abdur Rahim on 21/12/24.
//

import SwiftUI

struct ContentView: View {
    /*
     Key Features of @StateObject:
     Ownership: @StateObject is responsible for creating and owning the instance of the object. This means that the object is only created once for the lifetime of the view that declares it, and it won't be recreated during view updates.
     ObservableObject: The object must conform to the ObservableObject protocol, and the properties you want to observe must be marked with the @Published property wrapper.
     State Binding: Views that observe a @StateObject instance will automatically re-render whenever any of the @Published properties inside the ObservableObject change.
     
     Use @StateObject when you want to create and manage the lifecycle of an observable object within a view. If the object is created by the view and not passed from an external source, @StateObject should be used.
     
     View Ownership: @StateObject is used when a view creates and owns the instance of the observable object. It's responsible for ensuring the object is only created once and persists through view updates.
     Reactivity: When any @Published property in the object changes, the view automatically updates.
     Comparison with @ObservedObject: The key difference between @StateObject and @ObservedObject is that @StateObject creates and owns the object, while @ObservedObject is used when the object is passed into the view (i.e., it’s owned by some external source). If you use @ObservedObject in a view that creates the object, you might encounter issues where the object gets recreated every time the view updates.
     
     When to Choose @StateObject vs @ObservedObject:
     Use @StateObject when you want to create the object within the view and need to retain its state.
     Use @ObservedObject when the object is passed from a parent view or is owned by some other component of your app, and you just need to observe changes in that object.
     */
    @StateObject private var viewModel = PostViewModel()
    
    var body: some View {
        NavigationView {
            let _ = print("Load view")  //let _ = print("Some value")) is typically used when you want to print something for debugging purposes, but you don't want the printed output to affect the behavior of your code or return any value.
            //Why use let _ = with print()?
            
            // In Swift, print() returns a value of type Void (which is essentially (), a unit type). Normally, you might not need to capture the result of print(), since its purpose is only to print something to the console and doesn't affect the flow of the program. However, if you're writing code where Swift expects a value to be returned (e.g., within an expression), you can use let _ = to explicitly discard that value.
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                    let _ = print("Progress view!")
                } else if let errorMessage = viewModel.errorMessage {
                    
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                    let _ = print("Error in view!")
                } else {
                    NavigationView {
                        List(viewModel.posts) { post in
                            
                           
                            NavigationLink(destination: ItemView(post: post)) {
                                    VStack(alignment: .leading) {
                                        Text(post.title)
                                            .font(.headline)
                                        Text(post.body)
                                            .font(.subheadline)
                                        Spacer()
                                    }
                                }
                            
                            
                            //.navigationDestination(for: String.self, destination: ItemView(post: post))
                        }
                        .navigationTitle("Items List")
                    }
                    
                }
            }
            
        }
        .onAppear {
            
            viewModel.fetchPosts()
        }
        .navigationTitle("Posts")
    }
}

#Preview {
    ContentView()
}

struct ItemView: View {
   var post:Post
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.headline)
            Text(post.body)
                .font(.subheadline)
            Spacer()
        }
    }
    
}
