//
//  FlickrService.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/12/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

protocol FlickrService: class {
    func getFlickrImages(searchTerm: String, _ completion: @escaping ((Result<FlickrSearchResponse>) -> Void))
}

class FlickrServiceImplementation: FlickrService {
    
    // MARK: - Parameters

    private let requestFactory: FlickrServiceRequestFactory
    private let dispatcher: NetworkDispatcher

    // MARK: - Initialization

    init(requestFactory: FlickrServiceRequestFactory, dispatcher: NetworkDispatcher) {
        self.requestFactory = requestFactory
        self.dispatcher = dispatcher
    }

    // MARK: - Public
    
    /// GET flickr search request
    /// - Parameters:
    ///   - searchTerm: the search tag to send to flickr api
    ///   - completion: async callback when complete
    func getFlickrImages(searchTerm: String, _ completion: @escaping ((Result<FlickrSearchResponse>) -> Void)) {
        
        let request = requestFactory.makeFlickrSearchRequest(for: searchTerm)
        request.execute(dispatcher: dispatcher) { response in
            completion(response)
        }
    }
}
