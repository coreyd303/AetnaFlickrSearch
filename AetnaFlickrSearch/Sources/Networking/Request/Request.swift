//
//  Request.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/11/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

struct Request<T>: RequestType where T: Decodable {
    typealias ResponseType = T

    var data: RequestData
    var queue: Queue
}
