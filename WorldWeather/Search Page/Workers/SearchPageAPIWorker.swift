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

    func fetchSearchResults(for searchString: String, completionHandler: @escaping (Response.Search?, Error?) -> Void) {

    }


}
