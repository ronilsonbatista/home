//
//  HomeInteractor.swift
//  Home
//
//  Created by Ronilson Batista on 02/10/20.
//  Copyright © 2020 Ronilson Batista. All rights reserved.
//

import Foundation

// MARK: - HomeInteractorDelegate
protocol HomeInteractorDelegate: class {
    func productFetched(with product: Home)
    func handleFailure(with serviceError: ServiceError)
}

// MARK: - Main
class HomeInteractor {
    weak var delegate: HomeInteractorDelegate?

    func fetchProduct() {
         let serviceUrl = AppEnvironment.URL.value

        ServiceRequest.shared.request(method: .get, url: serviceUrl, parameters: nil, encoding: .default, success: { result in
            do {
                let typesPokemons = try JSONDecoder().decode(Home.self, from: result)
                self.delegate?.productFetched(with: typesPokemons)
            } catch {
                self.delegate?.handleFailure(with: .init(type: .notMapped))
            }
        }, failure: { serviceError  in
            self.delegate?.handleFailure(with: serviceError)
        })
    }
}
