//
//  Queue.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/11/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

class Queue {
    func async(withName name: String, _ work: @escaping (() -> Void)) {
        let dispatchQueue = DispatchQueue(label: name, qos: .background)
        dispatchQueue.async {
            work()
        }
    }

    func async(qos: DispatchQoS.QoSClass = .background, _ work: @escaping (() -> Void)) {
        DispatchQueue.global(qos: qos).async {
            work()
        }
    }

    func main(_ work: @escaping (() -> Void)) {
        DispatchQueue.main.async {
            work()
        }
    }
}
