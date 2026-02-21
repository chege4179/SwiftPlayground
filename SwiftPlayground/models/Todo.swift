//
//  Todo.swift
//  SwiftPlayground
//
//  Created by Peter Chege on 14/02/2026.
//
import Foundation
import SwiftData

@Model
class Todo {
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    
    init(title: String) {
        self.title = title
        self.isCompleted = false
        self.createdAt = Date()
        
    }
}
