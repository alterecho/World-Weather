//
//  PageProtocols.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 11/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

protocol PageProtocols {
    func showLoading()
    func hideLoading()
    func showAlert(title: String?, message: String)
}
