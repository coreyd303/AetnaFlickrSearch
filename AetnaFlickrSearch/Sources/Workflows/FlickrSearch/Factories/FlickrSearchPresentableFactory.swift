//
//  FlickrSearchPresentableFactory.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/12/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

protocol FlickrSearchPresentableFactory: class {
    func makeFlickrSearchPresentable() -> FlickrSearchPresentable
}

class FlickrSearchPresentableFactoryImplementation: FlickrSearchPresentableFactory {
    
    // MARK: - Public

    /// Create an instance of the request presentable
    /// - Returns: a FlickrSearchPresentable
    func makeFlickrSearchPresentable() -> FlickrSearchPresentable {
        let presentable = FlickrSearchViewController()
        let requestFactory = FlickrServiceRequestFactoryImplementation()
        let dispatcher = NetworkDispatcherImplementation()
        let flickrService = FlickrServiceImplementation(requestFactory: requestFactory, dispatcher: dispatcher)
        let opsManager = OpsManagerImplementation(queueName: "flickrSearch")
        let viewModel = FlickrSearchViewModelImplementation(flickrService: flickrService, opsManager: opsManager)

        viewModel.searchDelegate = presentable
        presentable.viewModel = viewModel

        return presentable
    }
}
