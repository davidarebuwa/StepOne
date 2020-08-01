//
//  ViewController.swift
//  StepOne
//
//  Created by David Arebuwa on 31/07/2020.
//  Copyright © 2020 David Arebuwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 4 ? 65 : 180
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section,indexPath.row) {
        case (0,0):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemViewCell") else {
                fatalError("Inavlid Cell dequeued")}
            return cell
        case (0,1):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemViewCell") else {
                fatalError("Inavlid Cell dequeued")}
            return cell
        case (0,2):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemViewCell") else {
                fatalError("Inavlid Cell dequeued")}
            return cell
        case (0,3):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemViewCell") else {
                fatalError("Inavlid Cell dequeued")}
            return cell
        case (0,4):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "checkoutCell") else {
                fatalError("Inavlid Cell dequeued")}
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let itemCell = cell as? ItemCell
        switch (indexPath.section,indexPath.row) {
        case (0,0):
            itemCell?.itemImage.image = UIImage(named: "sample")
            itemCell?.itemImage.layer.cornerRadius = 12
        case (0,1):
            itemCell?.itemImage.image = UIImage(named: "sample")
            itemCell?.itemImage.layer.cornerRadius = 12
        case (0,2):
            itemCell?.itemImage.image = UIImage(named: "sample")
            itemCell?.itemImage.layer.cornerRadius = 12
        case (0,3):
            itemCell?.itemImage.image = UIImage(named: "sample")
            itemCell?.itemImage.layer.cornerRadius = 12
        case(0,4):
            let cell = cell as? CheckoutCell
            cell?.checkoutButton.layer.cornerRadius = 12
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell selected")
        performSegue(withIdentifier: "showDetail", sender: nil)

    }
    
}

