//
//  Protocols.swift
//  switui
//
//  Created by Abdur Rahim on 19/01/25.
//

import Foundation
import UIKit

// Mark: - View
protocol ListViewProtocol:AnyObject {
    func displayItems(_ itms: [Item])
}

// Mark: - Interactor
protocol ListInteractorInputProtocol:AnyObject {
    func fetchItems()
}

protocol ListInteractorOutputProtocol:AnyObject {
    func didFetchItems(_ items:[Item])
}

// Mark: - Presenter
protocol ListPresenterProtocol:AnyObject {
    func viewDidLoad()
    func didSelectItem(_ item:Item)
}

// Mark: - Router
protocol ListRouterProtocol:AnyObject {
    static func createModule() -> ListViewController
    func navigationToDetail(from view:ListViewProtocol, with item:Item)
}
