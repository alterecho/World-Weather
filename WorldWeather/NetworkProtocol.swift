//
//  NetworkProtocol.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 12/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    func downloadData(request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Swift.Error?) -> Void)
}

extension URLSession: NetworkProtocol {
    func downloadData(request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Swift.Error?) -> Void) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            completionHandler(data, response, error)
        }.resume()
    }
}
