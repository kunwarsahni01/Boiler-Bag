//
//  ViewControllerTableViewCell.swift
//  Boiler Bag
//
//  Created by Kunwar Sahni on 9/14/19.
//  Copyright © 2019 hello world. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
