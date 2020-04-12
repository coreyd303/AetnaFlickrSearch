//
//  BaseCoordinator.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/11/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

class BaseCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []

    func start() {
        fatalError("BaseCoordinator must be subclassed")
    }

    func addDependency(_ coordinator: Coordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator}) else { return }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinator?) {
        guard !childCoordinators.isEmpty, let coordinator = coordinator else { return }
        if let coordinator = coordinator as? BaseCoordinator {
            if !coordinator.childCoordinators.isEmpty {
                coordinator.childCoordinators.filter({ $0 !== coordinator }).forEach({ coordinator.removeDependency($0) })
            }

        }

        for(index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
