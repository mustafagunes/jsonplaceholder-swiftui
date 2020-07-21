//
//  PostNetworkProvider.swift
//  jsonplaceholder-exam
//
//  Created by Mustafa GUNES on 21.07.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import Combine
import Foundation

/// Network provider for getting posts.
final class PostNetworkProvider: NetworkProvider {
    
    func getPosts() -> AnyPublisher<[Post], Error> {
        return dataTask(withEndpoint: .posts)
                   .decode(type: [Post].self, decoder: JSONDecoder())
                   .eraseToAnyPublisher()
    }
}
