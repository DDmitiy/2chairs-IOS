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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.companiesTableView.delegate = self
        self.companiesTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        APIService.instance.getCompanies { (success, error) in
        }
    }
    
    @IBAction func SceneBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return APIService.instance.companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "company")
        cell?.textLabel?.text = APIService.instance.companies[indexPath.row]
        return cell!
    }
}
