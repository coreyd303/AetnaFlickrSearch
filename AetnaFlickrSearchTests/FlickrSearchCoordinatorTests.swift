//
//  FlickrSearchCoordinatorTests.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/12/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import AetnaFlickrSearch

class FlickrSearchCoordinatorTests: QuickSpec {
    override func spec() {
        var sut: FlickrSearchCoordinatorImplementation!
        var mockRouter: MockRouter!
        var mockFactory: MockFlickrSearchPresentableFactory!
        
        beforeEach {
            mockRouter = MockRouter()
            mockFactory = MockFlickrSearchPresentableFactory()
            mockFactory.stubbedMakeFlickrSearchPresentableResult = MockFlickrSearchPresentable()

            sut = FlickrSearchCoordinatorImplementation(router: mockRouter, presentableFactory: mockFactory)
        }
        
        describe("a FlickrSearchCoordinatorImplementation") {
            
            it("should start") {
                sut.start()
                
                expect(mockRouter.invokedPresentCount).to(equal(1))
            }
        }
    }
}
