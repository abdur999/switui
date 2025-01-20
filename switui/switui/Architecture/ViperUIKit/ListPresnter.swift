//
//  ListPresnter.swift
//  switui
//
//  Created by Abdur Rahim on 19/01/25.
//

import Foundation

// MARK: - Presenter
class ListPresnter: ListPresenterProtocol, ListInteractorOutputProtocol {
    
    weak var view: ListViewProtocol?
    var interactor: ListInteractorInputProtocol?
    var router: ListRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchItems()
    }
    
    func didSelectItem(_ item: Item) {
        router?.navigationToDetail(from: view!, with: item)
    }
    
    func didFetchItems(_ items: [Item]) {
        view?.displayItems(items)
    }
    
    
}
