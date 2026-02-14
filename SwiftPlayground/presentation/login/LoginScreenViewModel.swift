//
//  LoginScreenViewModel.swift
//  SwiftPlayground
//
//  Created by Peter Chege on 14/02/2026.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    
    var isFormValid: Bool {
        !email.isEmpty &&
        email.contains("@") &&
        password.count >= 6
    }
    
    func login() {
        guard isFormValid else {
            errorMessage = "Please enter valid credentials."
            return
        }
        
        errorMessage = nil
        
        // Simulated login
        print("Logging in with \(email)")
        
        // Call your repository here
    }
}

