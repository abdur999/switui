//
//  GridView.swift
//  switui
//
//  Created by Abdur Rahim on 11/01/25.
//

import SwiftUI

struct GridView: View {
    let items = Array(1...20) //Example Data
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]   //Grid Column should be flexible to size according to its content
    var body: some View {
        ScrollView {  //Makes the grid scrollable
            LazyVGrid(columns: columns, spacing: 20) { //A vertical Grid Layout
                ForEach (items, id: \.self) { item in  // Loop through the data to populate the grid cells
                    Text("item \(item)")
                        .frame(maxWidth:.infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
    }
}

#Preview {
    GridView()
}