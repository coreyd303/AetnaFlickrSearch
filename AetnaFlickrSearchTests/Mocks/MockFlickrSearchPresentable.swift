//
//  MockFlickrSearchPresentable.swift
//  AetnaFlickrSearchTests
//
//  Created by Corey Davis on 4/12/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

@testable import AetnaFlickrSearch

class MockFlickrSearchPresentable: FlickrSearchViewController {
    var invokedDidFinishSetter = false
    var invokedDidFinishSetterCount = 0
    var invokedDidFinish: (() -> Void)?
    var invokedDidFinishList = [(() -> Void)?]()
    var invokedDidFinishGetter = false
    var invokedDidFinishGetterCount = 0
    var stubbedDidFinish: (() -> Void)!
    override var didFinish: (() -> Void)? {
        set {
            invokedDidFinishSetter = true
            invokedDidFinishSetterCount += 1
            invokedDidFinish = newValue
            invokedDidFinishList.append(newValue)
        }
        get {
            invokedDidFinishGetter = true
            invokedDidFinishGetterCount += 1
            return stubbedDidFinish
        }
    }
    var invokedDidSelectItemSetter = false
    var invokedDidSelectItemSetterCount = 0
    var invokedDidSelectItem: ((FlickrItem) -> Void)?
    var invokedDidSelectItemList = [((FlickrItem) -> Void)?]()
    var invokedDidSelectItemGetter = false
    var invokedDidSelectItemGetterCount = 0
    var stubbedDidSelectItem: ((FlickrItem) -> Void)!
    override var didSelectItem: ((FlickrItem) -> Void)? {
        set {
            invokedDidSelectItemSetter = true
            invokedDidSelectItemSetterCount += 1
            invokedDidSelectItem = newValue
            invokedDidSelectItemList.append(newValue)
        }
        get {
            invokedDidSelectItemGetter = true
            invokedDidSelectItemGetterCount += 1
            return stubbedDidSelectItem
        }
    }
    var invokedViewModelSetter = false
    var invokedViewModelSetterCount = 0
    var invokedViewModel: FlickrSearchViewModel?
    var invokedViewModelList = [FlickrSearchViewModel?]()
    var invokedViewModelGetter = false
    var invokedViewModelGetterCount = 0
    var stubbedViewModel: FlickrSearchViewModel!
    override var viewModel: FlickrSearchViewModel? {
        set {
            invokedViewModelSetter = true
            invokedViewModelSetterCount += 1
            invokedViewModel = newValue
            invokedViewModelList.append(newValue)
        }
        get {
            invokedViewModelGetter = true
            invokedViewModelGetterCount += 1
            return stubbedViewModel
        }
    }
    var invokedViewDidLoad = false
    var invokedViewDidLoadCount = 0
    override func viewDidLoad() {
        invokedViewDidLoad = true
        invokedViewDidLoadCount += 1
    }
}
