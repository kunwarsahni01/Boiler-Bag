//
//  DeliveryViewController.swift
//  Boiler Bag
//
//  Created by Kunwar Sahni on 9/15/19.
//  Copyright © 2019 hello world. All rights reserved.
//

import UIKit
import Firebase

class DeliveryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

    
    @IBOutlet weak var delivTableVIew: UITableView!
    
    var orderNum: String?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "storeToProfile"){
            let displayVC = segue.destination as! orderDetialViewController
            displayVC.orderNumber = orderNum
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // herro ios
    
    
    let tblArray = ["2385", "2386", "2387", "2389", "2390", "2391", "2392"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(tblArray.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text  = tblArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Poppins-Light", size: 35)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        orderNum = "\(tblArray[indexPath.row])"
        self.performSegue(withIdentifier: "delivToDetial", sender: self)
    }
}
