//
//  Utilities.swift
//  StepOne
//
//  Created by David Arebuwa on 01/08/2020.
//  Copyright © 2020 David Arebuwa. All rights reserved.
//

import UIKit
public extension UIViewController{
var topbarHeight: CGFloat {
    return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
        (self.navigationController?.navigationBar.frame.height ?? 0.0)
}
}
