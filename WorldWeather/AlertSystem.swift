//
//  AlertSystem.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit

/// To show common alerts
public class AlertSystem {
    static private var window: UIWindow?
    static private var alertVC: UIAlertController?

    public static func alert(title: String?, message: String?) {
        alertVC?.dismiss(animated: false, completion: nil)

        if #available(iOS 13, *) {
            if let scene = UIApplication.shared.connectedScenes.filter ({ $0.activationState == .foregroundActive }).first as? UIWindowScene {
                window = UIWindow(windowScene: scene)
            } else {
                print("ERROR FINDING FOREGROUND SCENE")
                window = UIWindow(frame: UIScreen.main.bounds)
            }
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        

        let viewController = UIViewController()

        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC = alertViewController
        alertVC?.view.accessibilityIdentifier = AccesssibilityIDs.alertSystem

        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            window = nil
        }
        alertViewController.addAction(okAction)
        window?.rootViewController = viewController
        window?.windowLevel = .alert + 1
        AlertSystem.window = window
        window?.makeKeyAndVisible()

        viewController.present(alertViewController, animated: true)
    }
}
