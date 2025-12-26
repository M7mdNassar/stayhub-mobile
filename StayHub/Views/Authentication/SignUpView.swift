import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var navigateToAccountCreated = false
    
    var body: some View {
        VStack {
            Text("Sign Up View")
                .font(.largeTitle)
                .padding()
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Create Account") {
                // API call
                navigateToAccountCreated = true
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            NavigationLink("Already have an account? Log in", destination: LoginView())
                .padding()
            
          
            .navigationDestination(
                isPresented: $navigateToAccountCreated) {
                    AccountCreatedView()
                            .hidden()
                         }
            
            
        }
        .navigationTitle("Sign Up")
    }
}
