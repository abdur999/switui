//
//  MVVMController.swift
//  switui
//
//  Created by Abdur Rahim on 21/01/25.
//

import Foundation
import UIKit

class ItemListViewControllerC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var viewModel: ItemListViewModelProtocolC!
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupViewModel()
        
        viewModel.fetchItems()
    }
    
    func setupViewModel() {
        let networkService = NetworkServiceC()
        let repository = ItemRepositoryC(networkService: networkService)
        let fetchItemsUseCase = FetchItemsUseCaseC(repository: repository)
        viewModel = ItemListViewModelC(fetchItemsUseCase: fetchItemsUseCase)
        
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // TableView DataSource and Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = viewModel.item(at: indexPath.row)
        cell.textLabel?.text = item.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.item(at: indexPath.row)
        let detailsVC = DetailsControllerC(item: item)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
