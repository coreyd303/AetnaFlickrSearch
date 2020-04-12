//
//  Presentable.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/11/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation
import UIKit

@objc protocol Presentable: Presenter {
    @objc func toPresent() -> UIViewController
}

extension UIViewController: Presentable {
    @objc func toPresent() -> UIViewController {
        return self
    }
}
