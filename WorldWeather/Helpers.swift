//
//  Helpers.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 7/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class Helpers {
    static func data(from filename: String?, ext: String?) throws -> Data {
        if let url = Bundle.main.url(forResource: filename, withExtension: ext) {
            return try Data(contentsOf: url)
        }

        throw Error.urlNotFound()
    }
}

