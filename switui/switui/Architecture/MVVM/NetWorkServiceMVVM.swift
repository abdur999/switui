//
//  NetWorkServiceMVVM.swift
//  switui
//
//  Created by Abdur Rahim on 21/01/25.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()

    func fetchItems(completion: @escaping (Result<[ItemMVVM], Error>) -> Void) {
        guard let url = URL(string: "https://api.example.com/items") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Data Error", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let items = try JSONDecoder().decode([ItemMVVM].self, from: data)
                completion(.success(items))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
