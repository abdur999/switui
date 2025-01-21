//
//  MVVMViewModel.swift
//  switui
//
//  Created by Abdur Rahim on 21/01/25.
//

// ItemListViewModel.swift
import Foundation

class ItemListViewModel {
    
    private var items: [ItemMVVM] = []
    private var onUpdate: (() -> Void)?
    
    var numberOfItems: Int {
        return items.count
    }
    
    func bind(onUpdate: @escaping () -> Void) {
        self.onUpdate = onUpdate
    }
    
    func fetchItems() {
        NetworkService.shared.fetchItems { [weak self] result in
            switch result {
            case .success(let items):
                self?.items = items
                DispatchQueue.main.async {
                    self?.onUpdate?()
                }
            case .failure(let error):
                print("Error fetching items: \(error)")
            }
        }
    }
    
    func item(at index: Int) -> ItemMVVM {
        return items[index]
    }
}

