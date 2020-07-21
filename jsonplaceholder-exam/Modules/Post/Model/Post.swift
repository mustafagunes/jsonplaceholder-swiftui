//
//  Post.swift
//  jsonplaceholder-exam
//
//  Created by Mustafa GUNES on 21.07.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import Foundation

/// Post model
struct Post: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}

// MARK: - Equatable
extension Post: Equatable {
    static func ==(lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
}
