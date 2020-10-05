//
//  SpotlightView.swift
//  Home
//
//  Created by Ronilson Batista on 02/10/20.
//  Copyright © 2020 Ronilson Batista. All rights reserved.
//

import UIKit
import AlamofireImage

// MARK: - Main
class SpotlightView: UIView {
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
                    nibName: SpotlightViewCell.identifier,
                    bundle: nil
               ),
            forCellWithReuseIdentifier: SpotlightViewCell.identifier
            )
        }
    }
    
    private var spotlight: [Spotlight] = []
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        Bundle.main.loadNibNamed("SpotlightView", owner: self, options: nil)
        addSubview(containerView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupData(spotlight: [Spotlight]?) {
        self.spotlight = spotlight ?? []
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate And UICollectionViewDataSource
extension SpotlightView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spotlight.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : SpotlightViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SpotlightViewCell.identifier, for: indexPath) as! SpotlightViewCell
        let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewLayout?.sectionInset.left = 20
        collectionViewLayout?.invalidateLayout()
        
        let imageString = spotlight[indexPath.row].bannerURL
        if let imageURL = URL(string: imageString) {
            cell.spotlightImage.af_setImage(withURL: imageURL)
        }
                
        return cell
    }
}
