//
//  HTTPMethod.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/11/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT" // update & replace
    case post = "POST"
    case patch = "PATCH" // update & modify
    case delete = "DELETE"
}
