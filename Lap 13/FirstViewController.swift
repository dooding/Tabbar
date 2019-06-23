//
//  FirstViewController.swift
//  Lap 13
//
//  Created by SWUCOMPUTER on 04/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import UserNotifications

class FirstViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // "shared" returns the singleton app instance
        let application = UIApplication.shared
        let center = UNUserNotificationCenter.current()
        // Requests authorization to interact with the user
        // when local and remote notifications arrive
        center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
        if granted { print("Approval granted to send notifications") }
        else { print(error!) } }
        application.registerForRemoteNotifications()
        
        application.applicationIconBadgeNumber = 0
    }

    @IBAction func addCoffee() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.coffee.append("커피 하나 추가요 ~")
        
        let tabController = appDelegate.window?.rootViewController
        let tableVC = tabController?.children[1] as! CoffeeTableViewController
        tableVC.coffeeTab.badgeValue = String(format: "%d", appDelegate.coffee.count)
        
        let application = UIApplication.shared
        application.applicationIconBadgeNumber = appDelegate.coffee.count + appDelegate.cocktail.count
    }
    
    @IBAction func addCocktail() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.cocktail.append("칵테일 하나 추가요!!")
        
        let tabController = appDelegate.window?.rootViewController
        let tableVC = tabController?.children[2] as! CockTailTableViewController
        tableVC.cocktailTab.badgeValue = String(format: "%d", appDelegate.cocktail.count)
        
        let application = UIApplication.shared
        application.applicationIconBadgeNumber = appDelegate.coffee.count + appDelegate.cocktail.count
    }
    
}

