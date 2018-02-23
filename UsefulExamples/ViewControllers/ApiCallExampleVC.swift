//
//  ApiCallExampleVC.swift
//  UsefulExamples
//
//  Created by Nitin Khurana on 23/02/18.
//  Copyright © 2018 Nitin Khurana. All rights reserved.
//

import UIKit
import SwiftyJSON

class ApiCallExampleVC: ViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView:UITableView!
    
    var data = [UserData]()
    
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of items in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if data == nil{
            return 0
        }
        
        return data.count
    }
    
    // table cell item
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        let cell = UITableViewCell()
        
        let gender = data[indexPath.row].gender
        cell.textLabel?.text = gender
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        RestApiManager.instance.callApi(url: AppConfig.URL_USERS, onCompletion: {json in
            
            let result = json["results"]
            for user in result{
                self.data.append(UserData(json: user.1))
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
