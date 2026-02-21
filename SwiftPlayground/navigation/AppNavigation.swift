//
//  AppNavigation.swift
//  SwiftPlayground
//
//  Created by Peter Chege on 14/02/2026.
//

import SwiftUI
import Foundation
import Combine

struct AppNavigation: View {
    
    @StateObject private var router = AppRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            HomeScreen()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .home:
                        HomeScreen()
                    case .all_posts:
                        PostsScreen()
                    case .post_details(let id):
                        PostScreen(postId: id)
                    case .login:
                        LoginScreen()
                        
                    case .bottomsheet:
                        BottomSheetScreen()
                
                    }
                    
                }
        }
        .environmentObject(router)
    }
    
}

#Preview {
    AppNavigation()
}
