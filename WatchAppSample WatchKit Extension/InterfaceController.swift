//
//  InterfaceController.swift
//  WatchAppSample WatchKit Extension
//
//  Created by Satoshi Kobayashi on 2019/07/23.
//  Copyright © 2019 Satoshi Kobayashi. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications

class InterfaceController: WKInterfaceController {
    @IBAction func onGoodButton() {
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.body = "body"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }

    }
    @IBAction func onBadButton() {
    }

    override func handleAction(withIdentifier identifier: String?, for localNotification: UILocalNotification) {
        print("local notification")
    }
    
    override func handleAction(withIdentifier identifier: String?, forRemoteNotification remoteNotification: [AnyHashable : Any]) {
        if identifier == "nazo" {
            let alertAction = WKAlertAction.init(title: "???", style: .default, handler: {
            })
            self.presentAlert(withTitle: "nazo", message: "???", preferredStyle: .alert, actions: [alertAction])
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
