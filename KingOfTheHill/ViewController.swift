//
//  ViewController.swift
//  KingOfTheHill
//
//  Created by Daniel Richards on 7/23/16.
//  Copyright © 2016 Daniel Richards. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBAction func MenuPressed(_ sender: UIBarButtonItem) {
        toggleSideMenuView()

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

