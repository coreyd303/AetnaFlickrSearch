//
//  FlickrSearchOperation.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/12/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

class FlickrSearchOperation: AFSOperation {
    
    var result: Result<FlickrSearchResponse>?
    
    private let service: FlickrService
    private let searchTerm: String
    
    init(service: FlickrService, searchTerm: String) {
        self.service = service
        self.searchTerm = searchTerm
    }
    
    override func main() {
        if isCancelled {
            finish(true)
            return 
        }
        
        executing(true)
        service.getFlickrImages(searchTerm: searchTerm) { [weak self] result in
            if self?.isCancelled == true {
                self?.executing(false)
                self?.finish(true)
                return
            }

            self?.result = result
            self?.executing(false)
            self?.finish(true)
        }
    }
}
