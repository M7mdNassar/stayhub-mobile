import SwiftUI

struct ForgotPasswordInputView: View {
    @State private var email = ""
    @State private var navigateToConfirmation = false
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Forgot Password")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 60)
            
            Text("Enter your email address and we'll send you a reset link")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            TextField("Email Address", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .padding(.horizontal)
            
            Button(action: {
                navigateToConfirmation = true
            }) {
                Text("Send Reset Link")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationDestination(isPresented: $navigateToConfirmation) {
            PasswordResetConfirmationView()
        }
    }
}
