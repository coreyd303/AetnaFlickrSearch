//
//  FlickrSearchResponse.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/12/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

struct FlickrSearchResponse: Equatable, Codable {
    let items: [FlickrItem]?
}

struct FlickrItem: Equatable, Codable {
    let title: String
    let link: String
    let media: FlickrMedia
    let dateTaken: String
    let description: String
    let published: String
    let author: String
    let authorId: String
    let tags: String
}

extension FlickrItem {
    func height() -> String {
        // TODO: - extract height value from description and return
        return "590"
    }
    
    func width() -> String {
        // TODO: - extract height value from description and return
        return "123"
    }
}

struct FlickrMedia: Equatable, Codable {
    let m: String
}

