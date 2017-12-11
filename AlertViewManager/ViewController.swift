//
//  ViewController.swift
//  AlertViewManager
//
//  Created by Appa Rao Mulpuri on 12/11/17.
//  Copyright © 2017 Appa Rao Mulpuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(_ sender: UIButton) {
        AlertViewManager.defaultManager.showOkAlert("Title", message: "Custom Mesasge for the title") { (action) in
            //Custom action code
        }
    }
}

