//
//  ItemsVC.swift
//  2chairs
//
//  Created by Somebody on 25.03.2018.
//  Copyright © 2018 OttersTeam. All rights reserved.
//

import UIKit

class ItemsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var companyNameLabel: UILabel!
    
    @IBOutlet weak var itemsTableView: UITableView!
    var names = ["Шкаф", "Cтол", "Картина"]
    var prices = ["9299р", "5599р", "1999р"]
    var images = ["cupboard", "table", "frame"]
    var companyName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemsTableView.delegate = self
        self.itemsTableView.dataSource = self
        companyNameLabel.text = companyName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "placer" {
            let destinationVC = segue.destination as! ChairsPlacerVC
            destinationVC.nodeName = "\(images[(self.itemsTableView.indexPathForSelectedRow?.row)!])"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! itemCell
        cell.nameLabel.text = names[indexPath.row]
        cell.priceLabel.text = prices[indexPath.row]
        cell.itemImageView.image = UIImage(named : "\(images[indexPath.row])")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "placer", sender: nil)
    }
    
    @IBAction func companyVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
