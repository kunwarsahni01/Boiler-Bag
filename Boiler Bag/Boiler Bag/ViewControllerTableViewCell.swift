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
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var checkMark: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        checkMark.isHidden = true
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        checkMark.isHidden = true
    }
}
