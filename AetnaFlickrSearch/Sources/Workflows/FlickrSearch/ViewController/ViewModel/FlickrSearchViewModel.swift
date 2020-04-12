//
//  FlickrSearchViewModel.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/12/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

protocol FlickrSearchDelegate: class {
    func didUpdateItems()
}

protocol FlickrSearchViewModel: class {
    var searchDelegate: FlickrSearchDelegate? { get set }
    var items: [FlickrItem] { get }

    func search(for searchTerm: String)
}

class FlickrSearchViewModelImplementation: FlickrSearchViewModel {
    
    // MARK: - Parameters

    private let flickrService: FlickrService
    private let opsManager: OpsManager
    private let queue: Queue
    
    weak var searchDelegate: FlickrSearchDelegate?
    
    private(set) var items: [FlickrItem] = [] {
        didSet {
            searchDelegate?.didUpdateItems()
        }
    }
    
    init(flickrService: FlickrService, opsManager: OpsManager, queue: Queue = Queue()) {
        self.flickrService = flickrService
        self.opsManager = opsManager
        self.queue = queue
    }
    
    func search(for searchTerm: String) {
        guard searchTerm.isEmpty == false else {
            items.removeAll()
            return
        }

        let searchOp = opsManager.newSearchOperation(searchTerm: searchTerm, service: flickrService)
        
        searchOp.completionBlock = { [weak self] in
            if searchOp.isCancelled { return }
            guard let result = searchOp.result else { return }
            
            switch result {
            case .success(let response):
                self?.enlistFlickrResults(for: searchTerm, from: response)
            case .failure(let err):
                AFSLog(err)
            }
        }
        
        opsManager.inProcess[searchTerm] = searchOp
        opsManager.processQueue.addOperation(searchOp)
    }
    
    private func enlistFlickrResults(for searchTerm: String, from response: FlickrSearchResponse) {
        guard let items = response.items else { return }
        
        queue.main { [weak self] in
            self?.opsManager.inProcess.removeValue(forKey: searchTerm)
            
            self?.items = items
            self?.searchDelegate?.didUpdateItems()
        }
    }
}
