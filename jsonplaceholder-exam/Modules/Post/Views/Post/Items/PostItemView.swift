//
//  PostItemView.swift
//  jsonplaceholder-exam
//
//  Created by Mustafa GUNES on 22.07.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import SwiftUI

/// View for displaying a post
struct PostItemView: View {
    
    // MARK: - Global Definitions
    @ObservedObject private var viewModel: PostItemViewModel
    
    // MARK: - Initializers
    init(viewModel: PostItemViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - UI
    var body: some View {
        Text(viewModel.title)
    }
}
