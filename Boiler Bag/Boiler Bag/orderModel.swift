//
//  orderModel.swift
//  Boiler Bag
//
//  Created by Kunwar Sahni on 9/15/19.
//  Copyright © 2019 hello world. All rights reserved.
//

import Foundation
import UIKit

class orderModel{
    var item: String?
    var price: Double?
    var store: String?
    
    init(item: String?, price: Double?, store: String?){
        self.item = item
        self.price = price
        self.store = store
    }
}
