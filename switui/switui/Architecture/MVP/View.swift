//
//  View.swift
//  switui
//
//  Created by Abdur Rahim on 20/01/25.
//

import Foundation
import UIKit

class PostListViewController: UIViewController, PostViewProtocol {
    
    private var presenter: PostPresenterProtocol!
    private var tableView: UITableView!
    private var posts: [PostM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Posts"
        presenter = PostPresenter(view: self)
        
        setupTableView()
        presenter.loadPosts()
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PostCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    // MARK: - PostViewProtocol
    
    func displayPosts(_ posts: [PostM]) {
        self.posts = posts
        tableView.reloadData()
    }
    
    func displayError(_ error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func navigateToPostDetail(_ post: PostM) {
        let detailVC = PostDetailViewController(post: post)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension PostListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectPost(at: indexPath.row)
    }
}
