//
//  SecondViewController.swift
//  Tabbar
//
//  Created by SWUCOMPUTER on 04/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addWine() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.cart.append("와인 하나 추가요 ***")
        //print("와인 하나 추가요")
        
        let tabController = appDelegate.window?.rootViewController
        let tableVC = tabController?.children[2] as! ThirdTableViewController
        tableVC.CartTabbar.badgeValue = String(format: "%d", appDelegate.cart.count)
        
        let application = UIApplication.shared
        
        application.applicationIconBadgeNumber = appDelegate.cart.count
        
    }


}

