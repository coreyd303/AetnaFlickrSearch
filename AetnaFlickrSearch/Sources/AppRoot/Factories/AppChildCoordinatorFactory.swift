//
//  AppChildCoordinatorFactory.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/12/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

protocol AppChildCoordinatorFactory: class {
    func makeFlickrSearchCoordinator() -> FlickrSearchCoordinator
}

class AppChildCoordinatorFactoryImplementation: AppChildCoordinatorFactory {

    // MARK: - Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }
    
    // MARK: - Public

    /// create an instance of requested coordinator
    /// - Returns: a FlickerSearchCoordinatorImplementation
    func makeFlickrSearchCoordinator() -> FlickrSearchCoordinator {
        let factory = FlickrSearchPresentableFactoryImplementation()
        
        return FlickrSearchCoordinatorImplementation(router: router, presentableFactory: factory)
    }
}
