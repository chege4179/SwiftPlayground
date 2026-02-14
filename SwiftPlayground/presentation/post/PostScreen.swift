//
//  PostScreen.swift
//  SwiftPlayground
//
//  Created by Peter Chege on 14/02/2026.
//

import SwiftUI

struct PostScreen: View {
    let postId: Int
    @StateObject private var viewModel = PostScreenViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let post = viewModel.post {
                Text(post.title)
                    .font(.title)
                    .padding()
                
                Text(post.body)
                    .font(.body)
                    .padding()
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            } else {
                Text("No post found")
            }
        }
        .navigationTitle("Post Detail")
        .onAppear {
            viewModel.loadPostById(id: String(postId))
        }
    }
}

#Preview {
    PostScreen(postId: 1)
}
