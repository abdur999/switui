//
//  CleanView.swift
//  switui
//
//  Created by Abdur Rahim on 21/01/25.
//

import Foundation
import SwiftUI

struct CleanView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to SwiftUI")
                    .padding()
                
                // NavigationLink to push the FullScreenUIViewController onto the stack
                NavigationLink(destination: MVPControllerWrapper()) {
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
