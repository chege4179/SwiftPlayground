//
//  Routes.swift
//  SwiftPlayground
//
//  Created by Peter Chege on 14/02/2026.
//

import Foundation


enum Route: Hashable {
    case home
    case all_posts
    case post_details(id: Int)
    
}
