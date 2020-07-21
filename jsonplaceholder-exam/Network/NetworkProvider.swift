//
//  NetworkProvider.swift
//  jsonplaceholder-exam
//
//  Created by Mustafa GUNES on 21.07.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import Combine
import Foundation

/// Base class for the network provider.
class NetworkProvider {
    
    private struct Constant {
        static let baseURL = "https://jsonplaceholder.typicode.com"
    }
        
    /// Get a publisher for making a request to the given endpoint.
    /// - Parameter endpoint: The endpoint to use.
    /// - Returns: An `AnyPublisher` with the data for the request or an error.
    func dataTask(withEndpoint endpoint: Endpoint) -> AnyPublisher<Data, Error> {
        guard let url = URL(string: "\(Constant.baseURL)\(endpoint.rawValue)") else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
        .receive(on: DispatchQueue.global()) //Observe Thread
        .tryMap { (data, response) -> Data in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw NetworkError.statusCode
            }
            return data
        }.eraseToAnyPublisher()
    }
}
