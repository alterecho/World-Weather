//
//  Area.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 7/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

struct Area: Codable {
    let areaName: String
    let country: String
    let region: String
    let latitude: Double
    let longitude: Double
    let weatherUrl: URL?
}
