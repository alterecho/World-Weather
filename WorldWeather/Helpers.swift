//
//  Helpers.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 7/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit

class Helpers {
    static func data(from filename: String?, ext: String?) throws -> Data {
        if let url = Bundle.main.url(forResource: filename, withExtension: ext) {
            return try Data(contentsOf: url)
        }

        throw Error.urlNotFound()
    }

    static func getKeyWindow() -> UIWindow? {

        let application = UIApplication.shared
        if #available(iOS 13, *) {
            if let scene = application.connectedScenes.filter ({ $0.activationState == .foregroundActive }).first as? UIWindowScene {
                return scene.windows.filter { $0.isKeyWindow}.first
            }
        } else {
            return application.keyWindow
        }

        return nil
    }

    static func getTopViewController() ->  UIViewController? {
        let rootVC = getKeyWindow()?.rootViewController
        if let navVC = rootVC as? UINavigationController {
            return navVC.topViewController
        }
        return rootVC
    }

    static func fill(_ view: UIView, in parentView: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: parentView.rightAnchor).isActive = true

    }


}

