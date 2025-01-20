//
//  Apimvp.swift
//  switui
//
//  Created by Abdur Rahim on 20/01/25.
//

import Foundation


protocol APIServiceProtocolMVP {
    func fetchPosts(completion: @escaping (Result<[PostM], Error>) -> Void)
}

class APIServiceMVP: APIServiceProtocolMVP {
    private let url = URL(string: "https://dummyjson.com/posts")!
    
    func fetchPosts(completion: @escaping (Result<[PostM], Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 404, userInfo: nil)))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(PostResponseM.self, from: data)
                completion(.success(response.posts))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
