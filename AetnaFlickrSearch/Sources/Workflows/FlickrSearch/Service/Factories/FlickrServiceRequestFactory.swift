//
//  FlickrServiceRequestFactory.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/12/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

protocol FlickrServiceRequestFactory: class {
    func makeFlickrSearchRequest(for searchTerm: String) -> Request<FlickrSearchResponse>
}

class FlickrServiceRequestFactoryImplementation: FlickrServiceRequestFactory {
    
    // MARK: - Parameters
    
    private let queue: Queue
    
    // MARK: - Initialization
    
    init(queue: Queue = Queue()) {
        self.queue = queue
    }
    
    // MARK: - Public
    
    /// create a new flickr search request
    /// - Parameter searchTerm: the search term to send to flickr
    /// - Returns: a Request object
    func makeFlickrSearchRequest(for searchTerm: String) -> Request<FlickrSearchResponse> {
        let params = ["tagmode": "any",
                      "format": "json",
                      "nojsoncallback": "1",
                      "tags": searchTerm]
        let urlPath = "https://api.flickr.com/services/feeds/photos_public.gne"
        let requestData = RequestData(urlPath: urlPath, queryParams: params)
        
        return Request<FlickrSearchResponse>(data: requestData, queue: queue)
        
    }
}
