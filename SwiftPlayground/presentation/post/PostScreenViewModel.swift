//
//  PostScreenViewModel.swift
//  SwiftPlayground
//
//  Created by Peter Chege on 14/02/2026.
//

import Foundation
import Combine

class PostScreenViewModel: ObservableObject {
    
    @Published var post: Post? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private let repository: PostRepositoryProtocol
    
    init(repository: PostRepositoryProtocol = PostRepository()) {
        self.repository = repository
    }
    
    func loadPostById(id:String) {
        isLoading = true
        errorMessage = nil
        
        repository.fetchPostsById(id: id)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] posts in
                self?.post = posts
            }
            .store(in: &cancellables)
    }
}
