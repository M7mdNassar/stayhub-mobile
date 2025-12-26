import SwiftUI

struct AccountCreatedView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
            
            Text("Account Created Successfully!")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
            
            Text("Welcome to StayHub")
                .font(.title3)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Button(action: {
                authManager.isAuthenticated = true
            }) {
                Text("Continue to Home")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 50)
        }
        .navigationBarBackButtonHidden()
    }
}
