//
//  UIViewController+Extension.swift
//  Home
//
//  Created by Ronilson Batista on 02/10/20.
//  Copyright © 2020 Ronilson Batista. All rights reserved.
//

import UIKit

private var loadingView: UIView = UIView()
private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

extension UIViewController {
    class var nibName: String {
        return String(describing: self)
    }

    func showActivityIndicator() {
        if let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
            loadingView.frame = window.frame
            loadingView.center = window.center
            loadingView.backgroundColor = UIColor(hexadecimal: 0x000000).withAlphaComponent(0.5)
            loadingView.clipsToBounds = true
            loadingView.alpha = 1
            
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            activityIndicator.style = .large
            activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
            
            DispatchQueue.main.async {
                loadingView.addSubview(activityIndicator)
                window.addSubview(loadingView)
            }
            
            activityIndicator.startAnimating()
        }
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2, animations: {
                loadingView.alpha = 0
            }, completion: { _ in
                loadingView.removeFromSuperview()
            })
        }
    }
}
