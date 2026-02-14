//
//  Post.swift
//  SwiftPlayground
//
//  Created by Peter Chege on 14/02/2026.
//

import Foundation


struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
