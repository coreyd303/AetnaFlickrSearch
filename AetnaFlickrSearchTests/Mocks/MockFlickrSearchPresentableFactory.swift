//
//  MockFlickrSearchPresentableFactory.swift
//  AetnaFlickrSearchTests
//
//  Created by Corey Davis on 4/12/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation
@testable import AetnaFlickrSearch

class MockFlickrSearchPresentableFactory: FlickrSearchPresentableFactory {
    var invokedMakeFlickrSearchPresentable = false
    var invokedMakeFlickrSearchPresentableCount = 0
    var stubbedMakeFlickrSearchPresentableResult: FlickrSearchPresentable!
    func makeFlickrSearchPresentable() -> FlickrSearchPresentable {
        invokedMakeFlickrSearchPresentable = true
        invokedMakeFlickrSearchPresentableCount += 1
        return stubbedMakeFlickrSearchPresentableResult
    }
}
