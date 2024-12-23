//
//  ApiService.swift
//  switui
//
//  Created by Abdur Rahim on 21/12/24.
//

import Combine
import Foundation

class APIService {
    func fetchPosts() -> AnyPublisher<[Post], Error> {
        // Example API URL
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
