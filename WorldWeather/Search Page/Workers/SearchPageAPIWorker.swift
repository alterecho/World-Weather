//
//  SearchPageAPIWorker.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 7/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class SearchPageAPIWorker: SearchPageAPIWorkerProtocol {

    private let network: NetworkProtocol
    
    required init(network: NetworkProtocol = URLSession.shared) {
        self.network = network
    }

    func fetchSearchResults(for searchString: String, noOfResults: Int, completionHandler: @escaping (Response.Search?, Swift.Error?) -> Void) {
        guard let url = API.searchURL(for: searchString, noOfResults: noOfResults) else {
            completionHandler(nil, NSError(domain: "URL", code: 1,
                                           userInfo: [NSLocalizedDescriptionKey : "Error forming URL for search"]))
            return
        }
        
        let request = URLRequest(url: url)
        network.downloadData(request: request) { (data, response, error) in
            if let data = data {
                do {
                    let searchResponse = try JSONDecoder().decode(Response.Search.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(searchResponse, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completionHandler(nil, error)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
            }
        }

    }


}
