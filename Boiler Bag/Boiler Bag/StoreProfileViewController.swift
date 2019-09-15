//
//  StoreProfileViewController.swift
//  Boiler Bag
//
//  Created by Kunwar Sahni on 9/14/19.
//  Copyright © 2019 hello world. All rights reserved.
//

import UIKit

class StoreProfileViewController: UIViewController {
    
    @IBOutlet weak var storeImage: UIImageView!
    var storeNameDetail: String?
    
    @IBOutlet weak var storeName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        storeName.text = storeNameDetail!
        storeImage.image = UIImage(named: storeNameDetail!)
    }
    
}
