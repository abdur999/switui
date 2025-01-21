//
//  MVVMC.swift
//  switui
//
//  Created by Abdur Rahim on 21/01/25.
//

import Foundation

protocol ItemListViewModelProtocolC {
    var numberOfItems: Int { get }
    func item(at index: Int) -> ItemC
    func fetchItems()
    var onUpdate: (() -> Void)? { get set }
}

class ItemListViewModelC: ItemListViewModelProtocolC {
    private var items: [ItemC] = []
    private let fetchItemsUseCase: FetchItemsUseCaseProtocolC
    
    var onUpdate: (() -> Void)?
    
    var numberOfItems: Int {
        return items.count
    }
    
    init(fetchItemsUseCase: FetchItemsUseCaseProtocolC) {
        self.fetchItemsUseCase = fetchItemsUseCase
    }
    
    func fetchItems() {
        fetchItemsUseCase.execute { [weak self] result in
            switch result {
            case .success(let items):
                self?.items = items
            case .failure(let error):
                print("Error fetching items: \(error)")
            }
            
            DispatchQueue.main.async {
                self?.onUpdate?()
            }
        }
    }
    
    func item(at index: Int) -> ItemC {
        return items[index]
    }
}
