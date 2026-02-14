//
//  PostsScreen.swift
//  SwiftPlayground
//
//  Created by Peter Chege on 14/02/2026.
//

import Foundation
import SwiftUI

struct PostsScreen: View {
    @EnvironmentObject private var router: AppRouter
    
    @StateObject private var viewModel = PostsScreenViewModel()
    
    var body: some View {
        
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            } else {
                List(viewModel.posts) { post in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 5)
                    .onTapGesture {apGesture in
                        router.navigate(to: .post_details(id: post.id))
                    }
                }
            }
            
        }
        .navigationTitle("Posts")
        .onAppear {
            viewModel.loadPosts()
        }
        
    }
}


#Preview {
    PostsScreen()
}
