//
//  SideNavigationViewController.swift
//  KingOfTheHill
//
//  Created by Daniel Richards on 7/23/16.
//  Copyright © 2016 Daniel Richards. All rights reserved.
//

import UIKit

class SideNavigationViewController: ENSideMenuNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyboard?.instantiateViewController(withIdentifier: "menuTableTableViewController") as! menuTableTableViewController
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: menu, menuPosition: ENSideMenuPosition.left)
        
        sideMenu?.menuWidth = 150
        
        view.bringSubview(toFront: navigationBar)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
