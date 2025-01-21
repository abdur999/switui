//
//  CleanControllerWrapper.swift
//  switui
//
//  Created by Abdur Rahim on 21/01/25.
//

import Foundation
import Foundation
import SwiftUI
import UIKit

// MARK: - SwiftUIView to UIKIT bridge
struct CleanControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PostListViewController {
        let listModule = PostListViewController()
        return listModule  // Return your custom UIKit view controller
    }
        
        func updateUIViewController(_ uiViewController: PostListViewController, context: Context) {
            // This method is used to update the view controller, if needed (not necessary here)
        }
}
