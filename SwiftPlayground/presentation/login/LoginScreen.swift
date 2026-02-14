//
//  LoginScreen.swift
//  SwiftPlayground
//
//  Created by Peter Chege on 14/02/2026.
//

import SwiftUI


struct LoginScreen: View {
    
    @StateObject private var viewModel = LoginViewModel()
    @State private var isPasswordVisible = false
    
    var body: some View {
        VStack(spacing: 24) {
            
            Spacer()
            
            // MARK: - Title
            VStack(spacing: 8) {
                Text("Welcome Back")
                    .font(.largeTitle)
                    .bold()
                
                Text("Please login to continue")
                    .foregroundColor(.gray)
            }
            
            // MARK: - Fields
            VStack(spacing: 16) {
                
                TextField("Email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                
                ZStack(alignment: .trailing) {
                    
                    if isPasswordVisible {
                        TextField("Password", text: $viewModel.password)
                    } else {
                        SecureField("Password", text: $viewModel.password)
                    }
                    
                    Button {
                        isPasswordVisible.toggle()
                    } label: {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 12)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
            }
            
            // MARK: - Error
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.footnote)
            }
            
            // MARK: - Login Button
            Button {
                viewModel.login()
            } label: {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.isFormValid ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .disabled(!viewModel.isFormValid)
            
            Spacer()
            
            // MARK: - Signup
            HStack {
                Text("Don't have an account?")
                Button("Sign Up") {
                    print("Navigate to Sign Up")
                }
                .fontWeight(.bold)
            }
            .font(.footnote)
            
        }
        .padding(24)
    }
}

#Preview {
    LoginScreen()
}
