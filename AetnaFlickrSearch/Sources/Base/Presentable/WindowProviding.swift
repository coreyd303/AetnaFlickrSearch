//
//  WindowProviding.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/11/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation
import UIKit

protocol WindowProviding: class {
    func setRootPresentable(_ presentable: Presentable)
}

extension UIWindow: WindowProviding {
    func setRootPresentable(_ presentable: Presentable) {
        rootViewController = presentable.toPresent()
        makeKeyAndVisible()
    }
}
