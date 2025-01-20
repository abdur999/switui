//
//  ListViewController.swift
//  switui
//
//  Created by Abdur Rahim on 19/01/25.
//

import Foundation
import UIKit

// MARK: - View
class ListViewController: UIViewController, ListViewProtocol {

    
    var presenter: ListPresenterProtocol?
    private var items: [Item] = []
    private let tableVieew = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Items"
        setupTableView()
        presenter?.viewDidLoad()
    }
    func setupTableView() {
        tableVieew.frame = view.bounds
        tableVieew.delegate = self
        tableVieew.dataSource = self
        tableVieew.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableVieew)
    }
    
    func displayItems(_ itms: [Item]) {
        self.items = itms
        tableVieew.reloadData()
    }
}
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presenter?.didSelectItem(item)
    }
}
