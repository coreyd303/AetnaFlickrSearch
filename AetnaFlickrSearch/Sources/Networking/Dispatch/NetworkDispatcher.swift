//
//  NetworkDispatcher.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/11/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation
import UIKit

protocol NetworkDispatcher {
    func dispatch(request: RequestData, multipart: Bool, completion: @escaping ((Result<Data>) -> Void))
}

struct NetworkDispatcherImplementation: NetworkDispatcher {

    // MARK: - Properties

    private let defaultHeaders: [String: String] = ["Content-Type": "application/json"]
    private let multipartHeaders: [String: String] = {
        return ["Content-Type": "multipart/form-data; boundary=\(boundaryString)"]
    }()

    private static let boundaryString: String = {
        return "--Pond5AppBoundary\(UUID().uuidString)"
    }()

    // MARK: - Public

    func dispatch(request: RequestData, multipart: Bool, completion: @escaping ((Result<Data>) -> Void)) {
        guard var urlComponents = URLComponents(string: request.path) else {
            completion(.failure(createError("invalid URL")))
            return
        }

        let queryParams = request.queryParams?.compactMap({ (name, value) -> URLQueryItem? in
            return URLQueryItem(name: name, value: value)
        })

        urlComponents.queryItems = queryParams

        var headers: [String: String] = multipart ? multipartHeaders : defaultHeaders
        request.headers?.forEach({ (key, value) in
            headers[key] = value
        })

        if let url = urlComponents.url {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = request.method.rawValue
            urlRequest.httpBody = request.body
            headers.forEach { (key, value) in
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }

            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error {
                    if let response = response as? HTTPURLResponse {
                        completion(.failure(createError(response.statusCode)))
                    }

                    completion(.failure(error))
                    return
                }

                guard let data = data else {
                    completion(.failure(createError("data not found")))
                    return
                }

                completion(.success(data))

            }.resume()
        }
    }
}
