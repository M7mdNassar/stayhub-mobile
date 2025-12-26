import SwiftUI

struct ForgotPasswordInputView: View {
    @State private var email = ""
    @State private var navigateToConfirmation = false
    
    var body: some View {
        VStack {
            Text("Forgot Password Input View")
                .font(.largeTitle)
                .padding()
            
            TextField("Email Address", text: $email)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Send Reset Link") {
                // API call
                navigateToConfirmation = true
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
          
            .navigationDestination(
                isPresented: $navigateToConfirmation) {
                    PasswordResetConfirmationView()
                    .hidden()
                             }
            
            
        }
        .navigationTitle("Forgot Password")
    }
}
