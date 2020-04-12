//
//  RequestData.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/11/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

struct RequestData {

    // MARK: - Properties

    var path: String
    var method: HTTPMethod
    var queryParams: [String: String]?
    var headers: [String: String]?
    let body: Data?

    // MARK: - Initialization

    init(target: NetworkTarget = .flyrURL, path: NetworkPath, method: HTTPMethod = .get, body: Data? = nil, queryParams: [String: String]? = nil, headers: [String: String]? = nil) {
        self.path = Network.baseURL(target) + path.description
        self.method = method
        self.body = body
        self.queryParams = queryParams
        self.headers = headers
    }

    init(urlPath: String, method: HTTPMethod = .get, body: Data? = nil, queryParams: [String: String]? = nil, headers: [String: String]? = nil) {
        self.path = urlPath
        self.method = method
        self.body = body
        self.queryParams = queryParams
        self.headers = headers
    }
}
