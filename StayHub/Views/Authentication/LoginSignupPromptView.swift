import SwiftUI

struct LoginSignupPromptView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            
            Image(systemName: "lock.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
            
            Text("Login Required")
                .font(.title)
                .bold()
            
            Text("Please log in or create an account to continue booking")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            NavigationLink(destination: LoginView()) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            
            NavigationLink(destination: SignUpView()) {
                Text("Create an Account")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            
            Button(action: {
                dismiss()
            }) {
                Text("Cancel")
                    .foregroundColor(.secondary)
            }
            .padding(.top)
            
            Spacer()
        }
    }
}
