//
//  ListInteractor.swift
//  switui
//
//  Created by Abdur Rahim on 19/01/25.
//

import Foundation

// MARK: - Interactor
class ListInteractor:ListInteractorInputProtocol {
    weak var presenter: ListInteractorOutputProtocol?
    
    func fetchItems() {
        let items = [
        Item(id: 1, title: "Title1", description: "Description1"),
        Item(id: 2, title: "Title2", description: "Description2"),
        Item(id: 3, title: "Title3", description: "Description3"),
        Item(id: 4, title: "Title4", description: "Description4"),
        Item(id: 5, title: "Title5", description: "Description5"),
        Item(id: 6, title: "Title6", description: "Description6"),
        Item(id: 7, title: "Title7", description: "Description7"),
        Item(id: 8, title: "Title8", description: "Description8")
        ]
        presenter?.didFetchItems(items)
    }
}
