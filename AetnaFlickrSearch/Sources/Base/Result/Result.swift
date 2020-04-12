//
//  Result.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/11/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error?)
}
