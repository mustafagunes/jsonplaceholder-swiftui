//
//  PostItemViewModel.swift
//  jsonplaceholder-exam
//
//  Created by Mustafa GUNES on 22.07.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import Combine
import Foundation

// View model for a post.
final class PostItemViewModel: ObservableObject, Identifiable {
    
    // MARK: - Global Definitions
    private let post: Post
    private var disposeBag = Set<AnyCancellable>()
    
    var title: String { post.title }
    
    init(post: Post) {
        self.post = post
    }
}
