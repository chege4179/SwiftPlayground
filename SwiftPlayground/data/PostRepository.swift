//
//  PostRepository.swift
//  SwiftPlayground
//
//  Created by Peter Chege on 14/02/2026.
//

import Foundation
import Combine

protocol PostRepositoryProtocol {
    func fetchPosts() -> AnyPublisher<[Post], Error>
    
    func fetchPostsById(id:String) -> AnyPublisher<Post, Error>

}
