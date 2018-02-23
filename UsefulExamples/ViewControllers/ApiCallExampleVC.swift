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
    
    var data:JSON!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if data  == nil{
            return 0
        }
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        let cell = UITableViewCell()
        
        let gender = (data[indexPath.row]["gender"]).rawString()
        cell.textLabel?.text = gender
        
        return cell
    }
    
    var URL_API = "http://api.randomuser.me/"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        RestApiManager.instance.callApi(url: URL_API, onCompletion: {json in
            
            self.data = json["results"]
            for _ in self.data!{
            
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
