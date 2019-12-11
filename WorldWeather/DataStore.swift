//
//  DataStore.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 8/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class DataStore {

    /// To save the order info of the area we save, since we use a dictionary to avoid duplicates
    private struct OrderedArea: Codable {
        let order: Int
        let area: Area
    }
    
    static let shared = DataStore()

    private let recentAreasListKey = "recent_areas"

    private init() {

    }

    func saveRecents(areas: [Area]) throws {
        var dictionary = [String: OrderedArea]()
        for i in (0..<areas.count).reversed() {
            let area = areas[i]
            let element = OrderedArea(order: i, area: area)
            dictionary[area.areaName] = element
        }

        UserDefaults.standard.set(try PropertyListEncoder().encode(dictionary), forKey: recentAreasListKey)
    }

    func loadRecents() throws -> [Area]? {
        guard let data = UserDefaults.standard.value(forKey: recentAreasListKey) as? Data else {
            throw Error.decodeError(description: "Unable to retrieve data for recent areas")
        }

        let orderedAreasDictionary = try PropertyListDecoder().decode([String: OrderedArea].self, from: data)
        var orderedAreaElement = orderedAreasDictionary.map { $0.value }
        orderedAreaElement.sort { $0.order < $1.order}
        let areas = orderedAreaElement.map { $0.area }
        return areas
    }

    func cache(data: Data, filename: String) throws -> URL {
        let temporaryImagePath = NSTemporaryDirectory().appending(filename)
        let temporaryURL = URL(fileURLWithPath: temporaryImagePath)
        try data.write(to: temporaryURL)
        return temporaryURL
    }
}
