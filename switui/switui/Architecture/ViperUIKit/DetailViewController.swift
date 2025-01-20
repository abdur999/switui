//
//  DetailViewController.swift
//  switui
//
//  Created by Abdur Rahim on 19/01/25.
//

import Foundation
import UIKit

// MARK: - View
class DetailViewController: UIViewController {
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = item?.title
        setUPUI()
    }
    private func setUPUI() {
        guard let item  = item else { return }
        let label = UILabel()
        label.text = item.description
        label.numberOfLines = 0
        label.textAlignment = .center
        label.frame = view.bounds
        view.addSubview(label)
    }
}
