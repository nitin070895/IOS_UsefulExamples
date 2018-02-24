//
//  ViewController.swift
//  UsefulExamples
//
//  Created by Nitin Khurana on 23/02/18.
//  Copyright © 2018 Nitin Khurana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var helper:HelperFunctions = HelperFunctions()
    
    @IBAction func openDifferentStoryboard(){

        let differentStoryBoard = UIStoryboard(name: "DifferentStoryboard", bundle: nil)
        let differentViewController = differentStoryBoard.instantiateViewController(withIdentifier: "DifferentViewController")
        self.present(differentViewController, animated: false, completion: nil)
    }
    
    @IBAction func showMessage(){

        helper.showAlertMessage(message: "Hello!", root: self.view, context: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

