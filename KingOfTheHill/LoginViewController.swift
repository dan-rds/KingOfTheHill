//
//  LoginViewController.swift
//  KingOfTheHill
//
//  Created by Jon Richards on 7/23/16.
//  Copyright © 2016 Daniel Richards. All rights reserved.
//

import Foundation

public class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // Create a variable that you want to send
        let text: String = nameTextField.text!
        
        let appDelegate = UIApplication.shared().delegate as! AppDelegate
        appDelegate.userName = text
    }

    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
    }
}

