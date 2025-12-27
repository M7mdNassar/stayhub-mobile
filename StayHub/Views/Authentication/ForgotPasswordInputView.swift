import SwiftUI

struct ForgotPasswordInputView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var navigateToConfirmation = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Back Button
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.primary)
                }
                .padding(.leading, 20)
                .padding(.top, 20)
                
                Spacer()
            }
            
            Spacer()
            
            VStack(spacing: 25) {
                // Icon
                ZStack {
                    Circle()
                        .fill(Color.cyan.opacity(0.1))
                        .frame(width: 80, height: 80)
                    
                    Image(systemName: "key.fill")
                        .font(.system(size: 35))
                        .foregroundColor(.cyan)
                }
                .padding(.bottom, 10)
                
                // Title
                Text("Forgot password?")
                    .font(.system(size: 28, weight: .bold))
                
                // Subtitle
                Text("Don't worry! It happens. Please enter the email address associated with your account and we'll send you a link to reset it.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                // Email Field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email address")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.primary)
                    
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                        TextField("Enter your email address", text: $email)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
                .padding(.horizontal, 30)
                .padding(.top, 20)
                
                // Send Reset Link Button
                Button(action: {
                    navigateToConfirmation = true
                }) {
                    Text("Send Reset Link")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.cyan)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)
                
                // Remember Password Link
                HStack {
                    Text("Remember your password?")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                    Button(action: { dismiss() }) {
                        Text("Login")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.cyan)
                    }
                }
                .padding(.top, 10)
            }
            
            Spacer()
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $navigateToConfirmation) {
            PasswordResetConfirmationView()
        }
    }
}
