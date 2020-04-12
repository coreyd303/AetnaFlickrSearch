//
//  OpsManager.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/11/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

protocol OpsManager: class {
    var inProcess: [String: Operation] { get set }
    var processQueue: OperationQueue { get }

    func newSearchOperation(searchTerm: String, service: FlickrService) -> FlickrSearchOperation
}

class OpsManagerImplementation: OpsManager {

    // MARK: - Properties

    private let queueName: String
    lazy var inProcess: [String: Operation] = [:]
    lazy var processQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = self.queueName
        return queue
    }()

    // MARK: - Initialization

    init(queueName: String) {
        self.queueName = queueName
    }
}

extension OpsManagerImplementation {
    func newSearchOperation(searchTerm: String, service: FlickrService) -> FlickrSearchOperation {
        return FlickrSearchOperation(service: service, searchTerm: searchTerm)
    }
}
