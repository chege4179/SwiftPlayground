//
//  PostRepositoryImpl.swift
//  SwiftPlayground
//
//  Created by Peter Chege on 14/02/2026.
//

import Foundation
import Combine


class PostRepository: PostRepositoryProtocol {
    
    func fetchPosts() -> AnyPublisher<[Post], Error> {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .handleEvents(receiveSubscription: { _ in
                print("➡️ Request started:", url)
            }, receiveOutput: { output in
                if let response = output.response as? HTTPURLResponse {
                    print("⬅️ Status Code:", response.statusCode)
                }
                
                print("⬅️ Raw Response:", String(data: output.data, encoding: .utf8) ?? "")
            }, receiveCompletion: { completion in
                print("🏁 Completion:", completion)
            })
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    
    func fetchPostsById(id: String) -> AnyPublisher<Post, Error> {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .handleEvents(receiveSubscription: { _ in
                print("➡️ Request started:", url)
            }, receiveOutput: { output in
                if let response = output.response as? HTTPURLResponse {
                    print("⬅️ Status Code:", response.statusCode)
                }
                
                print("⬅️ Raw Response:", String(data: output.data, encoding: .utf8) ?? "")
            })
            .map { $0.data }
            .decode(type: Post.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
