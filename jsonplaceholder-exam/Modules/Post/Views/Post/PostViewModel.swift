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
    let title: String = "POSTS"
    
    @Published private var posts = [Post]()
    @Published private(set) var postItems: [PostItemViewModel] = []
    
    private var disposeBag = Set<AnyCancellable>()
    private let networkProvider: PostNetworkProvider
    
    init(networkProvider: PostNetworkProvider = PostNetworkProvider()) {
        self.networkProvider = networkProvider
        
        bind()
        loadPost()
    }
    
    func reload() {
        loadPost()
    }
    
    private func bind() {
        $posts.eraseToAnyPublisher()
            .receive(on: DispatchQueue.global())
            .map { [weak self] posts in
                guard self != nil else { return [] }
                return posts.map {
                    return PostItemViewModel(post: $0)
                }
            }
        .replaceError(with: [])
        .receive(on: DispatchQueue.main)
        .assign(to: \.postItems, on: self)
        .store(in: &disposeBag)
    }
    
    private func loadPost() {
        networkProvider.getPosts()
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.posts, on: self)
            .store(in: &disposeBag)
    }
}
