//
//  NetworkTarget.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/11/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

struct Network {
    fileprivate static var infoDict: [String: Any] {
        if let dict = Bundle.main.infoDictionary {
            return dict
        } else {
            fatalError("Plist could not be found")
        }
    }

    static func baseURL(_ key: NetworkTarget) -> String {
        switch key {
        case .flyrURL:
            guard let value = infoDict[NetworkTarget.flyrURL.value()] as? String else { return "" }
            return value
        case .assURL:
            guard let value = infoDict[NetworkTarget.assURL.value()] as? String else { return "" }
            return value
        case .templateCDN:
            guard let value = infoDict[NetworkTarget.templateCDN.value()] as? String else { return "" }
            return value
        }
    }
}

enum NetworkTarget {
    case flyrURL
    case assURL // AnimationS (as a) Service
    case templateCDN

    func value() -> String {
        switch self {
        case .flyrURL:
            return "flyrServerURL"
        case .assURL:
            return "socialStudioServerURL"
        case .templateCDN:
            return "templateCDN"
        }
    }
}
