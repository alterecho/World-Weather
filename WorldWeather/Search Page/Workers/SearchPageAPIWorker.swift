//
//  SearchPageAPIWorker.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 7/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import Foundation

class SearchPageAPIWorker: SearchPageAPIWorkerProtocol {

    private let session: URLSession
    
    required init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func fetchSearchResults(for searchString: String, noOfResults: Int, completionHandler: @escaping (Response.Search?, Swift.Error?) -> Void) {
        guard let url = API.searchURL(for: searchString, noOfResults: noOfResults) else {
            //TODO: handle error
            return
        }

        let request = URLRequest(url: url)
        session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let searchResponse = try JSONDecoder().decode(Response.Search.self, from: data)
                    completionHandler(searchResponse, nil)
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
        }.resume()

    }


}
