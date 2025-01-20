//
//  DetailRouter.swift
//  switui
//
//  Created by Abdur Rahim on 19/01/25.
//

import Foundation
import UIKit

// MARK: - Router
class DetailRouter {
    static func createModule(with item:Item) -> UIViewController {
        let view = DetailViewController()
        view.item = item
        return view
    }
}
