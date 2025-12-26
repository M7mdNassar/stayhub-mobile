import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var username = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var navigateToSignUp = false
    @State private var navigateToForgotPassword = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Login View")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button("Login") {
                    authManager.login(username: username, password: password)
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                NavigationLink("Create an Account", destination: SignUpView())
                    .padding()
                
                NavigationLink("Forgot Password?", destination: ForgotPasswordInputView())
                    .padding()
                
                Button("Browse as Guest") {
                    // Navigate to GuestHomeView
                }
                .padding()
            }
            .navigationTitle("Login")
        }
    }
}
