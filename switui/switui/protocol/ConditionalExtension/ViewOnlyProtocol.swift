//
//  ViewOnlyProtocol.swift
//  switui
//
//  Created by Abdur Rahim on 11/01/25.
//

import Foundation
import UIKit
import SwiftUI

// Below protocol used for UIKit only
// Self: UIView :- ensures that only classes inheriting from UIView can conform to the UIViewOnlyConfigurable protocol
// AnyObject :- Restricts the protocol to reference types (eg, UIView which is class
protocol UIViewOnlyConfigurable: AnyObject where Self: UIView {
    func configureView()
}

// Default implementation of protocol using extension
extension UIViewOnlyConfigurable {
    func configureView() {
        backgroundColor = .white
    }
}
// Implementation of UIKit UIView only and class type only
class CustomSwiftUIKitView: UIView, UIViewOnlyConfigurable {
    func configureView() {
        backgroundColor = .blue
        layer.cornerRadius = 10
    }
}



// Below protocol used for SwiftUI only
// Self: View :- ensures that only SwiftUI View can conform to the ViewOnlyConfigurable protocol
protocol ViewOnlyConfigurable where Self: View {
    func setUpView()
}

// Default implementation of protocol using extension
extension ViewOnlyConfigurable {
    func setUpView() {
        
    }
}

//Implementation of SwiftUI View
struct CustomSwiftUIView: View, ViewOnlyConfigurable {
    func setUpView() {
        print("Setting SwiftUI View")
    }
    var body: some View {
        Text("Hello SwiftUI")
            .onAppear {
                setUpView()
            }
    }
}
