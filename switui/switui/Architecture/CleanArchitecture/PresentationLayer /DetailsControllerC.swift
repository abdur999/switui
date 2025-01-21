//
//  DetailsControllerC.swift
//  switui
//
//  Created by Abdur Rahim on 21/01/25.
//

import Foundation

import UIKit

class DetailsControllerC: UIViewController {
    
    private let item: ItemC
    private var titleLabel: UILabel!
    private var descriptionLabel: UILabel!
    
    init(item: ItemC) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = item.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = item.description
        descriptionLabel.numberOfLines = 0
        
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
}
