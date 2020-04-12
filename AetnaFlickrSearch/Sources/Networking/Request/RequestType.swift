//
//  RequestType.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/11/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

protocol RequestType {
    associatedtype ResponseType: Decodable
    var data: RequestData { get set }
    var queue: Queue { get set }
}

extension RequestType {

    // MARK: - Public

    func execute(multiPart: Bool = false, dispatcher: NetworkDispatcher, _ completion: @escaping ((Result<ResponseType>) -> Void)) {
        dispatcher.dispatch(request: self.data, multipart: multiPart, completion: { (responseData: Result<Data>) in
            self.queue.main {
                completion(self.responseFrom(responseData: responseData))
            }
        })
    }

    private func responseFrom(responseData: Result<Data>) -> Result<ResponseType> {
        switch responseData {
        case .success(let data):
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

                let result = try jsonDecoder.decode(ResponseType.self, from: data)
                return .success(result)
            } catch {
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}
