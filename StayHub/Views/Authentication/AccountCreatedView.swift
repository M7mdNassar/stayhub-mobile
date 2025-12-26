import SwiftUI

struct AccountCreatedView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        VStack {
            Text("Account Created View")
                .font(.largeTitle)
                .padding()
            
            Text("Account Created Successfully!")
                .font(.title2)
                .padding()
            
            Button("Continue to Home") {
                authManager.isAuthenticated = true
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
}
