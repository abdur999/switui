//
//  USeCaseC.swift
//  switui
//
//  Created by Abdur Rahim on 21/01/25.
//

import Foundation

protocol FetchItemsUseCaseProtocolC {
    func execute(completion: @escaping (Result<[ItemC], Error>) -> Void)
}

class FetchItemsUseCaseC: FetchItemsUseCaseProtocolC {
    private let repository: ItemRepositoryProtocolC
    
    init(repository: ItemRepositoryProtocolC) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (Result<[ItemC], Error>) -> Void) {
        repository.fetchItems(completion: completion)
    }
}
