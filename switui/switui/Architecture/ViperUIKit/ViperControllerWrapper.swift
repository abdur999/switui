//
//  ViperControllerWrapper.swift
//  switui
//
//  Created by Abdur Rahim on 19/01/25.
//

import Foundation
import SwiftUI
import UIKit

// MARK: - SwiftUIView to UIKIT bridge
struct ViperControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ListViewController {
        let listModule = ListRouter.createModule()
        return listModule  // Return your custom UIKit view controller
    }
        
        func updateUIViewController(_ uiViewController: ListViewController, context: Context) {
            // This method is used to update the view controller, if needed (not necessary here)
        }
}
