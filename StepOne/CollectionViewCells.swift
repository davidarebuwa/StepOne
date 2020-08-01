//
//  CollectionViewCells.swift
//  StepOne
//
//  Created by David Arebuwa on 01/08/2020.
//  Copyright © 2020 David Arebuwa. All rights reserved.
//

import UIKit
class ImageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}
class DescriptionCell: UICollectionViewCell {
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var sizeTextField: UITextField!
    @IBOutlet weak var quantityValue: UILabel!
    
    @IBOutlet weak var quantityStepper: UIStepper!
}
class BuyButtonCell: UICollectionViewCell {
    @IBOutlet weak var buytButton: UIButton!
}
