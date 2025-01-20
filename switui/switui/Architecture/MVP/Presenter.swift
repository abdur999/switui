//
//  Presenter.swift
//  switui
//
//  Created by Abdur Rahim on 20/01/25.
//

import Foundation

protocol PostViewProtocol: AnyObject {
    func displayPosts(_ posts: [PostM])
    func displayError(_ error: String)
    func navigateToPostDetail(_ post: PostM)
}

protocol PostPresenterProtocol {
    func loadPosts()
    func didSelectPost(at index: Int)
}

class PostPresenter: PostPresenterProtocol {
    private let apiService: APIServiceProtocolMVP
    private weak var view: PostViewProtocol?

    private var posts: [PostM] = []
    
    init(view: PostViewProtocol, apiService: APIServiceProtocolMVP = APIServiceMVP()) {
        self.view = view
        self.apiService = apiService
    }
    
    func loadPosts() {
        apiService.fetchPosts { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = posts
                DispatchQueue.main.async {
                    self?.view?.displayPosts(posts)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.view?.displayError(error.localizedDescription)
                }
            }
        }
    }
    
    func didSelectPost(at index: Int) {
        guard index < posts.count else { return }
        let post = posts[index]
        // Navigate to detail screen
        // You would normally do this via a router or coordinator,
        // but for simplicity, we are directly notifying the view
        // that it should push the detail view.
        
        view?.navigateToPostDetail(post)
    }
}
