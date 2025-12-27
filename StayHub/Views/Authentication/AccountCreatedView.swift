import SwiftUI

struct AccountCreatedView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            // Success Icon
            ZStack {
                Circle()
                    .fill(Color.cyan.opacity(0.1))
                    .frame(width: 140, height: 140)
                
                Circle()
                    .fill(Color.cyan)
                    .frame(width: 120, height: 120)
                
                Image(systemName: "checkmark")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(.white)
            }
            
            // Title
            Text("Welcome Aboard!")
                .font(.system(size: 28, weight: .bold))
            
            // Subtitle
            Text("Your account has been created successfully. You're all set to find your perfect stay.")
                .font(.system(size: 15))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
            
            // Start Exploring Button
            Button(action: {
                authManager.isAuthenticated = true
            }) {
                HStack {
                    Text("Start Exploring")
                        .font(.system(size: 16, weight: .semibold))
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.cyan)
                .cornerRadius(12)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 50)
        }
        .navigationBarBackButtonHidden()
    }
}
