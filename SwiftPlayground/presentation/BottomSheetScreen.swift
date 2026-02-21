//
//  BottomSheetScreen.swift
//  SwiftPlayground
//
//  Created by Peter Chege on 14/02/2026.
//

import SwiftUI

struct BottomSheetScreen: View {
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            Button("Open Bottom Sheet") {
                showSheet = true
            }
        }
        .sheet(isPresented: $showSheet) {
            BottomSheetView()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }
}

struct BottomSheetView: View {
    var body: some View {
        VStack {
            Text("Hello from the bottom sheet 👋")
                .font(.title)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    BottomSheetScreen()
}
