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
    var id: String?
    var name: String?
    var picture: String?
    var price: String?
    
    init(category: String?, id: String?, name: String?, picture: String?, price: String?){
        self.id = id
        self.name = name
        self.picture = picture
        self.price = price
    }
}
