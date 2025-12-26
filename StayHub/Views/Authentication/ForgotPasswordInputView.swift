import SwiftUI

struct ForgotPasswordInputView: View {
    @State private var email = ""
    @State private var navigateToConfirmation = false
    
    var body: some View {
        VStack {
            Text("Forgot Password Input View")
                .font(.largeTitle)
                .padding()
            
            TextField("Email Address", text: $email)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Send Reset Link") {
                // API call
                navigateToConfirmation = true
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            NavigationLink("", destination: PasswordResetConfirmationView(), isActive: $navigateToConfirmation)
                .hidden()
        }
        .navigationTitle("Forgot Password")
    }
}//
//  ForgotPasswordInputView.swift
//  StayHub
//
//  Created by Mac on 26/12/2025.
//

