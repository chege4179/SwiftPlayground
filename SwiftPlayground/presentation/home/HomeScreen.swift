//
//  HomeScreen.swift
//  SwiftPlayground
//
//  Created by Peter Chege on 14/02/2026.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject private var router: AppRouter
    
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Go to All Posts") {
                router.navigate(to: .all_posts)
            }
        }
        .navigationTitle("Home")
    }
}

#Preview {
    HomeScreen()
}
