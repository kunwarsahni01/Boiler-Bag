//
//  DelivTableViewCell.swift
//  Boiler Bag
//
//  Created by Kunwar Sahni on 9/15/19.
//  Copyright © 2019 hello world. All rights reserved.
//

import UIKit

class DelivTableViewCell: UITableViewCell {

    @IBOutlet weak var orderNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
