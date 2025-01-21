//
//  DataC.swift
//  switui
//
//  Created by Abdur Rahim on 21/01/25.
//

import Foundation

protocol ItemRepositoryProtocolC {
    func fetchItems(completion: @escaping (Result<[ItemC], Error>) -> Void)
}

class ItemRepositoryC: ItemRepositoryProtocolC {
    private let networkService: NetworkServiceProtocolC
    
    init(networkService: NetworkServiceProtocolC) {
        self.networkService = networkService
    }
    
    func fetchItems(completion: @escaping (Result<[ItemC], Error>) -> Void) {
        networkService.fetchItems(completion: completion)
    }
}
