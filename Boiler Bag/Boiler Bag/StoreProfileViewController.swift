//
//  StoreProfileViewController.swift
//  Boiler Bag
//
//  Created by Kunwar Sahni on 9/14/19.
//  Copyright © 2019 hello world. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class StoreProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tblStore: UITableView!
    @IBOutlet weak var submitButtonTap: UIButton!
    @IBOutlet weak var submitButton: UIImageView!
    @IBOutlet weak var storeImage: UIImageView!
    var storeNameDetail: String?
    var orderNumber:Int?
    var refStores: DatabaseReference!
    @IBOutlet weak var storeName: UILabel!
     var refStores2: DatabaseReference!

    var storeList = [storeModel]()
    var selectedItems = [Bool]()

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        let store: storeModel
        store = storeList[indexPath.row]
        cell.lblName.text = store.name
        cell.lblPrice.text = "$\(store.price!)"
        cell.productImage.sd_setImage(with: URL(string: store.picture!), placeholderImage: UIImage(named: "ford"))
        cell.productImage.layer.cornerRadius = 20.0
        cell.productImage.clipsToBounds = true
        cell.checkMark.isHidden = !selectedItems[indexPath.row]

        return cell
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeList.count
    }


    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 168.0
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.isHidden = true
        submitButtonTap.isHidden = true
        Database.database().reference().child("random").child("random").observeSingleEvent(of: .value) { (snapshot) in
            guard let random = snapshot.value as? Int else {return}
            self.orderNumber = random + 1
            let values = ["random": self.orderNumber]
            Database.database().reference().child("random").updateChildValues(values)
        }

        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        view.addGestureRecognizer(rightSwipe)

        var childType: String
        if(storeNameDetail! == "Third Street Market" ){
            childType = "Markets"
        }else if(storeNameDetail == "Urban Market"){
            childType = "Markets"
        }else if (storeNameDetail == "Stewart Market"){
            childType = "Markets"
        }else if(storeNameDetail == "Starbucks"){
            childType = "Starbucks"
        }else if(storeNameDetail == "Earhart"){
            childType = "Earhart OTG"
        }else if(storeNameDetail == "Ford"){
            childType = "Ford on the go"
        }else if(storeNameDetail == "Windsor"){
            childType = "Windsor ON THE GO"
        }else{
            childType = "Markets"
        }
        refStores = Database.database().reference().child("18sLfEv4TJHGvcaPUl8LLfeIE_R-_dTCwCszPHX7OrYo").child(childType)
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

                    let store = storeModel(category: storesCategory as! String?, id: storesId as! Int?, name: storesName as! String?, picture: storesPicture as! String?, price: storesPrice as! Double?)

                    self.storeList.append(store)
                    self.selectedItems.append(false)
                }
                self.tblStore.reloadData()
            }
        })
    }



    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        submitButton.isHidden = false
        submitButtonTap.isHidden = false
        if let cell = tableView.cellForRow(at: indexPath) as? ViewControllerTableViewCell {
            if(selectedItems[indexPath.row]==false){
                selectedItems[indexPath.row] = true

                let values = ["Store": storeNameDetail,"Item": cell.lblName.text, "Price": cell.lblPrice.text]
                 Database.database().reference().child("orders").child("\(orderNumber!)").child("\(indexPath[1])").updateChildValues(values)
                self.tblStore.reloadData()
            }else {
                selectedItems[indexPath.row] = false
                Database.database().reference().child("orders").child("\(orderNumber!)").child("\(indexPath[1])").removeValue()
                self.tblStore.reloadData()

            }
        }
    }


    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                self.performSegue(withIdentifier: "detailToList", sender: self)
            default:
                break
            }
        }
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
