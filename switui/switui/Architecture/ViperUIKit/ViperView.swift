//
//  ViperView.swift
//  switui
//
//  Created by Abdur Rahim on 19/01/25.
//

import SwiftUI

struct ViperView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to SwiftUI")
                    .padding()
                
                // NavigationLink to push the FullScreenUIViewController onto the stack
                                NavigationLink(destination: ViperControllerWrapper()) {
                                    Text("Go to Full-Screen UIKit View")
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                                .navigationTitle("SwiftUI Navigation")
            }
        }
    }
}

#Preview {
    ViperView()
}
