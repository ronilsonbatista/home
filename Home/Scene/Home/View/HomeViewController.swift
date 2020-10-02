//
//  HomeViewController.swift
//  Home
//
//  Created by Ronilson Batista on 02/10/20.
//  Copyright © 2020 Ronilson Batista. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomePresenter?
    
    init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: HomeViewController.nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - UIViewController lifecycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
