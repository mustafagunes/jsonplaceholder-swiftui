//
//  NetworkError.swift
//  jsonplaceholder-exam
//
//  Created by Mustafa GUNES on 21.07.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

/// Network Error Results
enum NetworkError: Error {
    case statusCode
    case invalidURL
    case notFound
}
