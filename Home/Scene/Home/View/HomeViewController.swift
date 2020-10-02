//
//  HomeViewController.swift
//  Home
//
//  Created by Ronilson Batista on 02/10/20.
//  Copyright © 2020 Ronilson Batista. All rights reserved.
//

import UIKit
import SVProgressHUD

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
        
        presenter?.delegate = self
        presenter?.fetchProduct()
    }
}

// MARK: - UIViewController lifecycle
extension HomeViewController: HomePresenterDelegate {
    func didStartLoading() {
        showActivityIndicator()
    }
    
    func didHideLoading() {
        hideActivityIndicator()
    }
    
    func didReloadData() {
        
    }
    
    func didFail(with serviceError: ServiceError) {
        let alert = UIAlertController(title: "Erro encontrado", message: "Desculpe-nos pelo erro. Iremos contorná-lo o mais rápido possível. \nMotivo: \(serviceError.type.description)", preferredStyle: .actionSheet)
        present(alert, animated: true, completion: nil)
    }
}
