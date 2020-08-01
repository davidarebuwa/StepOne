//
//  ItemCell.swift
//  StepOne
//
//  Created by David Arebuwa on 01/08/2020.
//  Copyright © 2020 David Arebuwa. All rights reserved.
//

import UIKit
class ItemCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemSize: UILabel!
    @IBOutlet weak var itemQuantityStepper: UIStepper!
    @IBOutlet weak var itemQuantityLabel: UILabel!
    
}

class CheckoutCell: UITableViewCell{
    
    @IBOutlet weak var checkoutButton: UIButton!
}
