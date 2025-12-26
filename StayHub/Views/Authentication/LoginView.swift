import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var username = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var navigateToGuest = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 25) {
                    Spacer(minLength: 60)
                    
                    // Logo
                    Image(systemName: "airplane.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color.blue)
                    
                    Text("StayHub")
                        .font(.system(size: 36, weight: .bold))
                    
                    // Login Form
                    VStack(spacing: 20) {
                        TextField("Username or Email", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                        
                        HStack {
                            if showPassword {
                                TextField("Password", text: $password)
                                    .textInputAutocapitalization(.never)
                            } else {
                                SecureField("Password", text: $password)
                            }
                            
                            Button(action: { showPassword.toggle() }) {
                                Image(systemName: showPassword ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        
                        Button(action: {
                            authManager.login(username: username, password: password)
                        }) {
                            Text("Login")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Links
                    NavigationLink(destination: ForgotPasswordInputView()) {
                        Text("Forgot Password?")
                            .foregroundColor(.blue)
                    }
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Create an Account")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    
                    Button(action: {
                        navigateToGuest = true
                    }) {
                        Text("Browse as Guest")
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $navigateToGuest) {
                GuestHomeView()
            }
        }
    }
}
