//
//  FlickrSearchCoordinator.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/12/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation
import UIKit

protocol FlickrSearchCoordinator: Coordinator {
    var didFinish: (() -> Void)? { get set }
}

class FlickrSearchCoordinatorImplementation: FlickrSearchCoordinator {
    
    // MARK: - Parameters
    
    private let router: Router
    private let presentableFactory: FlickrSearchPresentableFactory
    
    var didFinish: (() -> Void)?
    
    // MARK: - Initialization

    init(router: Router, presentableFactory: FlickrSearchPresentableFactory) {
        self.router = router
        self.presentableFactory = presentableFactory
    }

    // MARK: - Coordinator

    func start() {
        let presentable = presentableFactory.makeFlickrSearchPresentable()
        
        presentable.didFinish = { [weak self] in
            self?.didFinish?()
        }
        
        presentable.didSelectItem = { item in
            let alertController = UIAlertController(title: "Time is scarce ...", message: item.title, preferredStyle: .alert)
            
            let action1 = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            
            alertController.addAction(action1)

            presentable.present(alertController, animated: true, completion: nil)
        }

        router.present(presentable, animated: true, completion: nil)
    }
}
