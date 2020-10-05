//
//  CashView.swift
//  Home
//
//  Created by Ronilson Batista on 05/10/20.
//  Copyright © 2020 Ronilson Batista. All rights reserved.
//

import UIKit
import AlamofireImage

// MARK: - Main
class CashView: UIView {
    @IBOutlet fileprivate weak var containerView: UIView! {
        didSet {
            containerView.frame = self.bounds
            containerView.autoresizingMask = [
                .flexibleHeight,
                .flexibleWidth
            ]
        }
    }
    
    @IBOutlet weak var cashImage: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        Bundle.main.loadNibNamed("CashView", owner: self, options: nil)
        addSubview(containerView)
    }
    
    func setupData(cash: Cash?) {
        if let imageString = cash?.bannerURL, let imageURL = URL(string: imageString) {
            cashImage.af_setImage(withURL: imageURL)
        }
    }
}
