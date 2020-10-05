//
//  ProductView.swift
//  Home
//
//  Created by Ronilson Batista on 05/10/20.
//  Copyright © 2020 Ronilson Batista. All rights reserved.
//

import UIKit
import AlamofireImage

// MARK: - Main
class ProductView: UIView {
    @IBOutlet fileprivate weak var containerView: UIView! {
        didSet {
            containerView.frame = self.bounds
            containerView.autoresizingMask = [
                .flexibleHeight,
                .flexibleWidth
            ]
        }
    }
    
    @IBOutlet fileprivate weak var collectionView: UICollectionView! {
        didSet {
            collectionView.backgroundColor = .clear
            collectionView.allowsMultipleSelection = false
            collectionView.register(
                UINib(
                    nibName: ProductViewCell.identifier,
                    bundle: nil
                ),
                forCellWithReuseIdentifier: ProductViewCell.identifier
            )
        }
    }
    
    private var product: [Product] = []
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        Bundle.main.loadNibNamed("ProductView", owner: self, options: nil)
        addSubview(containerView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupData(product: [Product]?) {
        self.product = product ?? []
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate And UICollectionViewDataSource
extension ProductView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ProductViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductViewCell.identifier, for: indexPath) as! ProductViewCell
        let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewLayout?.sectionInset.left = 20
        collectionViewLayout?.invalidateLayout()
        
        let imageString = product[indexPath.row].imageURL
        if let imageURL = URL(string: imageString) {
            cell.productImage.af_setImage(withURL: imageURL)
        }
        
        return cell
    }
}
