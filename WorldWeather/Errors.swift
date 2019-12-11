//
//  Errors.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 7/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

enum Error: Swift.Error {
    case urlNotFound(description: String? = nil)
    case nilValue(description: String? = nil)
    case decodeError(description: String? = nil)
}
