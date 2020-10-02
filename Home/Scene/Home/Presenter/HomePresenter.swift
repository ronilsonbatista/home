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
    
}

// MARK: - Main
class HomePresenter {
    weak var delegate: HomePresenterDelegate?
    
    private var interactor: HomeInteractor?
    private var router: HomeRouter?
    
    init(interactor: HomeInteractor, router: HomeRouter) {
        interactor.delegate = self
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - HomeInteractorDelegate
extension HomePresenter: HomeInteractorDelegate {
    
}
