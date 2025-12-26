import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Profile View")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("User Information")
                        .font(.headline)
                        .padding()
                    
                    Text("Account Settings")
                        .font(.headline)
                        .padding()
                    
                    Button("Logout") {
                        authManager.logout()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            }
            .navigationTitle("Profile")
        }
    }
}
