//
//  storeModel.swift
//  Boiler Bag
//
//  Created by Kunwar Sahni on 9/14/19.
//  Copyright © 2019 hello world. All rights reserved.
//

import Foundation
import UIKit

class storeModel{
    var category: String?
    var id: Int?
    var name: String?
    var picture: String?
    var price: Double?
    
    init(category: String?, id: Int?, name: String?, picture: String?, price: Double?){
        self.id = id
        self.name = name
        self.picture = picture
        self.price = price
    }
}
