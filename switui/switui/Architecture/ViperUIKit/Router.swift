//
//  Router.swift
//  switui
//
//  Created by Abdur Rahim on 19/01/25.
//

import Foundation
import UIKit

// MARK: - Router
class ListRouter:ListRouterProtocol {
    static func createModule() -> ListViewController {
        let view = ListViewController()
        let interactor = ListInteractor()
        let presenter = ListPresnter()
        let router = ListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func navigationToDetail(from view: ListViewProtocol, with item: Item) {
        let detailView = DetailRouter.createModule(with: item)
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(detailView, animated: true)
        }
    }
    
    
}
