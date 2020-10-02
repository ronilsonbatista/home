//
//  UIViewController+Extension.swift
//  Home
//
//  Created by Ronilson Batista on 02/10/20.
//  Copyright © 2020 Ronilson Batista. All rights reserved.
//

import UIKit

extension UIViewController {
    class var nibName: String {
        return String(describing: self)
    }
}
