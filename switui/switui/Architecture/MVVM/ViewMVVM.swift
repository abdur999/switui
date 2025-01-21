//
//  ViewMVVM.swift
//  switui
//
//  Created by Abdur Rahim on 21/01/25.
//
// ItemListViewController.swift

import UIKit

class ItemListViewControllerMVVM: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var viewModel: ItemListViewModel!
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ItemListViewModel()
        
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
        
        viewModel.bind { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.fetchItems()
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
        let detailsVC = ItemDetailsViewControllerMVVM(item: item)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}


