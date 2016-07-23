//
//  menuTableTableViewController.swift
//  KingOfTheHill
//
//  Created by Daniel Richards on 7/23/16.
//  Copyright © 2016 Daniel Richards. All rights reserved.
//

import UIKit

class menuTableTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.contentInset = UIEdgeInsetsMake(70, 0, 0, 0)    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var destinationVC: UIViewController!
        
        if indexPath.row == 1 {
            destinationVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController}
        
        else if indexPath.row == 2 {
            destinationVC = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController}
        
            
        else {destinationVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController}
        
        
        sideMenuController()?.setContentViewController(destinationVC)
    }
    
   }
