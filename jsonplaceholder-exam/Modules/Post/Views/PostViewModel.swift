//
//  PostViewModel.swift
//  jsonplaceholder-exam
//
//  Created by Mustafa GUNES on 21.07.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import Combine
import Foundation

/// ViewModel for a list of posts.
final class PostViewModel: ObservableObject {
    
    // MARK: - Global Definitions
    let title: String = "Posts"
    
    @Published private var posts = [Post]()
    
    private var disposeBag = Set<AnyCancellable>()
    private let networkProvider: PostNetworkProvider
    
    init(networkProvider: PostNetworkProvider = PostNetworkProvider()) {
        self.networkProvider = networkProvider
    }
    
    func reload() {
        loadPost()
    }
    
    private func loadPost() {
        networkProvider.getPosts()
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.posts, on: self)
            .store(in: &disposeBag)
    }
}
