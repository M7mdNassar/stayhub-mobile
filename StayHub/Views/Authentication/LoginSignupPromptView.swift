import SwiftUI

struct LoginSignupPromptView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Login/Signup Prompt View")
                .font(.largeTitle)
                .padding()
            
            Text("Please log in or sign up to continue")
                .font(.title3)
                .padding()
            
            NavigationLink("Login", destination: LoginView())
                .buttonStyle(.borderedProminent)
                .padding()
            
            NavigationLink("Create an Account", destination: SignUpView())
                .buttonStyle(.bordered)
                .padding()
            
            Button("Cancel") {
                dismiss()
            }
            .padding()
        }
    }
}
