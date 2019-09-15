//
//  StoreProfileViewController.swift
//  Boiler Bag
//
//  Created by Kunwar Sahni on 9/14/19.
//  Copyright © 2019 hello world. All rights reserved.
//

import UIKit
import Firebase

class StoreProfileViewController: UIViewController{
    @IBOutlet weak var tblStore: UITableView!
    
    @IBOutlet weak var storeImage: UIImageView!
    var storeNameDetail: String?
    var refStores: DatabaseReference!
    @IBOutlet weak var storeName: UILabel!
    
    var storeList = [storeModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        refStores = Database.database().reference().child("8sLfEv4TJHGvcaPUl8LLfeIE_R-_dTCwCszPHX7OrYo").child("Markets")
        refStores.observe(DataEventType.value, with:{ (snapshot) in
            if snapshot.childrenCount>0{
                self.storeList.removeAll()
                for stores in snapshot.children.allObjects as![DataSnapshot]{
                    let storesObject = stores.value as? [String: AnyObject]
                    let storesCategory = storesObject?["Category"]
                    let storesId = storesObject?["ID"]
                    let storesName = storesObject?["Name"]
                    let storesPrice = storesObject?["Price"]
                    let storesPicture = storesObject?["picture"]
                    
                    let store = storeModel(category: storesCategory as! String?, id: storesId as! String?, name: storesName as! String?, picture: storesPicture as! String?, price: storesPicture as! String?)
                    
                    self.storeList.append(store)
                }
                self.tblStore.reloadData()
            }
        })
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        refreshView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func refreshView(){
    storeName.text = storeNameDetail!
    storeImage.image = UIImage(named: storeNameDetail!)
    }
    
    @IBAction func goBack(_ sender: Any) {
        print("button pressed")
        navigationController?.popViewController(animated: true)
    }
}
