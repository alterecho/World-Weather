//
//  LaunchArgsHandler.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 13/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit

class LaunchArgsHandler {
    static func handleArgs() {

        let arguments = ProcessInfo.processInfo.arguments

        if arguments.contains(LaunchArgs.testAlert) {
            // on iOS 13 and above, there are no connected scenes immediately at this point
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                AlertSystem.alert(title: "test", message: "alert")
            }

        } else if arguments.contains(LaunchArgs.testLoadIndicator) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                let topVC = Helpers.getTopViewController()
                let loadIndicator = LoadIndicator()
                topVC?.view.addSubview(loadIndicator)
                if let view = topVC?.view {
                    Helpers.fill(loadIndicator, in: view)
                }
                DispatchQueue.main.async {
                    print(loadIndicator)
                }
                loadIndicator.isLoading = true
            }

        }
    }
}
