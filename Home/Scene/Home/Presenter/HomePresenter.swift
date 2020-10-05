//
//  HomePresenter.swift
//  Home
//
//  Created by Ronilson Batista on 02/10/20.
//  Copyright © 2020 Ronilson Batista. All rights reserved.
//

import Foundation

// MARK: - HomePresenterDelegate
protocol HomePresenterDelegate: class {
    func didStartLoading()
    func didHideLoading()
    func didReloadData()
    func didFail(with serviceError: ServiceError)
}

// MARK: - Main
class HomePresenter {
    weak var delegate: HomePresenterDelegate?
    
    private var interactor: HomeInteractor?
    private var router: HomeRouter?
    private(set) var product: HomeEntity?
    
    init(interactor: HomeInteractor, router: HomeRouter) {
        interactor.delegate = self
        self.interactor = interactor
        self.router = router
    }
    
    func fetchProduct() {
        delegate?.didStartLoading()
        interactor?.fetchProduct()
    }
}

// MARK: - HomeInteractorDelegate
extension HomePresenter: HomeInteractorDelegate {
    func productFetched(with product: HomeEntity) {
        self.product = product
        delegate?.didHideLoading()
        delegate?.didReloadData()
    }
    
    func handleFailure(with serviceError: ServiceError) {
        delegate?.didHideLoading()
        delegate?.didFail(with: serviceError)
    }
}
