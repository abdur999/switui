//
//  NetworkServiceC.swift
//  switui
//
//  Created by Abdur Rahim on 21/01/25.
//
import Foundation

protocol NetworkServiceProtocolC {
    func fetchItems(completion: @escaping (Result<[ItemC], Error>) -> Void)
}

class NetworkServiceC: NetworkServiceProtocolC {
    func fetchItems(completion: @escaping (Result<[ItemC], Error>) -> Void) {
        guard let url = URL(string: "https://api.example.com/items") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
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
                let items = try JSONDecoder().decode([ItemC].self, from: data)
                completion(.success(items))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
