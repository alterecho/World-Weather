//
//  DataStore.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class DataStore {
    
    static let shared = DataStore()

    private let recentAreasListKey = "recent_areas"

    private init() {

    }

    func saveRecents(areas: [Area]) throws {
        UserDefaults.standard.set(try PropertyListEncoder().encode(areas), forKey: recentAreasListKey)
    }

    func loadRecents() throws -> [Area]? {
        guard let data = UserDefaults.standard.value(forKey: recentAreasListKey) as? Data else {
            throw Error.decodeError(description: "Unable to retrieve data for recent areas")
        }

        return try PropertyListDecoder().decode([Area].self, from: data)
    }

    func cache(data: Data, filename: String) throws -> URL {
        let temporaryImagePath = NSTemporaryDirectory().appending(filename)
        let temporaryURL = URL(fileURLWithPath: temporaryImagePath)
        try data.write(to: temporaryURL)
        return temporaryURL
    }
}
