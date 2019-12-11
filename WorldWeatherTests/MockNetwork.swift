//
//  MockNetwork.swift
//  WorldWeatherTests
//
//  Created by v.a.jayachandran on 12/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation
@testable import WorldWeather

class MockNetwork: NetworkProtocol {
    var filename: String?
    func downloadData(request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Swift.Error?) -> Void) {

        guard let filename = filename else {
            return completionHandler(nil, nil, Error.nilValue(description: "no file name set"))
        }

        do {
            let data = try Helpers.data(from: filename, ext: nil)
            completionHandler(data, nil, nil)
        } catch {
            completionHandler(nil, nil, error)
        }
    }
}
