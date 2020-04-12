//
//  AppCoordinator.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/12/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

protocol AppCoordinator: Coordinator { }

class AppCoordinatorImplementation: BaseCoordinator, AppCoordinator {
    
    // MARK: - Parameters

    let window: WindowProviding
    let router: Router
    let childFactory: AppChildCoordinatorFactory
    
    var appState: AppState {
        didSet {
            if appState != .launching {
                self.present(appState)
            }
        }
    }
    
    // MARK: - Initialization

    init(window: WindowProviding, router: Router, childFactory: AppChildCoordinatorFactory, appState: AppState = .launching) {
        self.window = window
        self.router = router
        self.childFactory = childFactory
        self.appState = .launching
    }
    
    // MARK: - Coordinator

    override func start() {
        window.setRootPresentable(router)
        present(appState)
    }
    
    // MARK: - Private

    private func present(_ appState: AppState) {
        switch appState {
        case .launching:
            // make intial call to flickr if needed?
            
            self.appState = .main
        case .main:
            let childCoordinator = childFactory.makeFlickrSearchCoordinator()
            
            addDependency(childCoordinator)
            
            childCoordinator.didFinish = { [weak self] in
                self?.removeDependency(childCoordinator)
            }
            
            childCoordinator.start()
        }
    }
}
