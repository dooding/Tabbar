//
//  FirstViewController.swift
//  Tabbar
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
        else { print(error!)
            }
        }
        application.registerForRemoteNotifications()
        
    }
    
    @IBAction func addBeer() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.cart.append("맥주 하나 추가요 ~")
        //print("맥주 하나 추가요")
        
        let tabController = appDelegate.window?.rootViewController //앱 델리게이트의 텝바 컨트롤러 접근하고 나서
        let tableVC = tabController?.children[2] as! ThirdTableViewController //췰드런은 탭이 몇개냐(현재 우리는 탭이 3개잇음) _ 그래서 세번째 텝바에 접근하고 싶다
        tableVC.CartTabbar.badgeValue = String(format: "%d", appDelegate.cart.count)
            
        let application = UIApplication.shared
        application.applicationIconBadgeNumber = appDelegate.cart.count
        
        
        application.applicationIconBadgeNumber = 0
        
    }
    
    


}

