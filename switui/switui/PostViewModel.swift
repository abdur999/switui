//
//  PostViewModel.swift
//  switui
//
//  Created by Abdur Rahim on 21/12/24.
//


import Combine
import Foundation

/*
 In SwiftUI, the ObservableObject protocol plays a key role in managing state that can be shared across multiple views. It is used to define data models that can be observed for changes. When a property in an ObservableObject is updated, any view that is observing that object will automatically update to reflect the new data.

 Here's a more detailed explanation of the ObservableObject protocol and how it works in SwiftUI:

 What is ObservableObject?
 ObservableObject is a protocol that you apply to a class to make it observable by SwiftUI views.
 It allows an instance of the class to notify views when its data changes, causing those views to re-render automatically.
 How does it work?
 When a class conforms to ObservableObject, its properties can be observed by SwiftUI views using property wrappers such as @StateObject, @ObservedObject, or @EnvironmentObject.
 Any property in an ObservableObject class that is marked with @Published will notify the views observing it whenever its value changes. This is what triggers a UI update.
 */
class PostViewModel: ObservableObject {
    /*
     In SwiftUI, the @Published property wrapper is used to mark properties of a class that conform to the ObservableObject protocol. When a property marked with @Published changes, it automatically triggers updates in any views that are observing the ObservableObject. This is a key mechanism in SwiftUI's data-binding and reactive design, allowing the UI to stay in sync with the underlying data.

     Key Points About @Published:
     Triggers View Updates: When a @Published property changes, it causes any view that is observing the ObservableObject to refresh. This is what allows SwiftUI's declarative UI to react to changes in data.
     Works with ObservableObject: The @Published property wrapper is used in conjunction with the ObservableObject protocol. The class needs to conform to ObservableObject, and the properties that should trigger view updates when changed must be marked with @Published.
     Automatic View Refresh: When the value of a @Published property changes, the view that is observing this object will automatically re-render, updating the UI to reflect the latest state.
     
     When to Use @Published:
     Use @Published for properties within a class that need to notify SwiftUI views about state changes.
     It’s typically used inside an ObservableObject to make sure the state changes are observable by any view that is observing the object.
     It’s ideal for managing local, mutable state inside models that need to update the UI when their data changes.
     
     What Happens Behind the Scenes:
     When you mark a property with @Published, it creates a publisher (using the Combine framework under the hood) that emits a signal every time the property's value changes.
     SwiftUI observes this publisher and automatically triggers a UI update when it detects a change in the value of the @Published property.

     */
    
    @Published var posts: [Post] = [] // Live data (array of posts)
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let apiService = APIService()
    
    // Fetch live data
    func fetchPosts() {
        isLoading = true
        apiService.fetchPosts()
            .sink(receiveCompletion: { completion in
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    // your code here
                    self.isLoading = false
                }
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.errorMessage = "Failed to load posts: \(error.localizedDescription)"
                }
            }, receiveValue: { posts in
                
                
                self.posts = posts
                
                
            })
            .store(in: &cancellables)
    }
}

