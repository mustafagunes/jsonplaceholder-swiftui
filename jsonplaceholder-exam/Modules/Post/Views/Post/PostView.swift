//
//  PostView.swift
//  jsonplaceholder-exam
//
//  Created by Mustafa GUNES on 21.07.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import SwiftUI

struct PostView: View {
    
    // MARK: - Global Definitions
    @ObservedObject private var viewModel = PostViewModel()
    
    // MARK: - UI
    var body: some View {
        NavigationView {
            List(viewModel.postItems) { PostItemView(viewModel: $0) }
                .navigationBarTitle(Text(viewModel.title), displayMode: .large)
                .navigationBarItems(trailing:
                    Button(action: viewModel.reload) {
                        Image("refresh")
                    }
                )
        }
    }
}
