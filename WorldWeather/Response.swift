//
//  Response.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 7/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class Response {

    struct Value: Decodable {
        let value: String

        enum CodingKeys: String, CodingKey {
            case value
        }

        init(from decoder: Decoder) throws {
            let decoder = try  decoder.singleValueContainer()
            let array = try decoder.decode([[String: String]].self)

            if let value = array.first?["value"] {
                self.value = value
            } else {
                throw Error.nilValue(description: "unable to decode value")
            }
        }
    }

    struct Search: Decodable {
        struct Result: Decodable {
            let areaName: Value?
            let country: Value?
            let region: Value?
            let latitude: String?
            let longitude: String?
            let population: String?
            let weatherUrl: Value?
        }

        let results: [Result]?

        enum CodingKeys: String, CodingKey {
            case search_api = "search_api"
            case result = "result"
        }

        init(from decoder: Decoder) throws {
            let decoder = try  decoder.container(keyedBy: CodingKeys.self)

            let results = try decoder.decode([String: [Result]].self, forKey: .search_api)
            self.results = results[CodingKeys.result.rawValue]
        }

    }
    
}
