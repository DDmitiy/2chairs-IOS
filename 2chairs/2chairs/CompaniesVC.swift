//
//  CompaniesVC.swift
//  2chairs
//
//  Created by Somebody on 24.03.2018.
//  Copyright © 2018 OttersTeam. All rights reserved.
//

import UIKit

class CompaniesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var companiesTableView: UITableView!
    var companies = ["Ля Мебеля", "Всё в дом", "Стул & стол", "Обстановочка", "Roombox", "Авангард", "Сибарит", "Евростиль" ,"Империя мебели","Мебельная лавка", "Штрих", "Лидер", "Красный дом", "Космос"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.companiesTableView.delegate = self
        self.companiesTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "items" {
            let destinationVC = segue.destination as! ItemsVC
             destinationVC.companyName = "\(companies[(self.companiesTableView.indexPathForSelectedRow?.row)!])"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "company")
        cell?.textLabel?.text = companies[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "items", sender: nil)
    }
}
