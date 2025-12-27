import SwiftUI

struct PasswordResetConfirmationView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            // Success Icon
            ZStack {
                Circle()
                    .fill(Color.cyan.opacity(0.1))
                    .frame(width: 140, height: 140)
                
                Image(systemName: "envelope.badge.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.cyan)
            }
            
            // Title
            Text("Check your mail")
                .font(.system(size: 28, weight: .bold))
            
            // Subtitle
            Text("We have sent password recovery instructions to your email.")
                .font(.system(size: 15))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
            
            // Return to Login Button
            Button(action: {
                dismiss()
            }) {
                Text("Return to Login")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.cyan)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 30)
            
            // Resend Email
            VStack(spacing: 5) {
                Text("Did not receive the email? Check your spam filter, or")
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                
                Button(action: {}) {
                    Text("Resend email")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.cyan)
                }
            }
            .padding(.top, 10)
            .padding(.bottom, 50)
        }
        .navigationBarBackButtonHidden()
    }
}
