import SwiftUI

struct PasswordResetConfirmationView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Password Reset Confirmation View")
                .font(.largeTitle)
                .padding()
            
            Text("Reset link sent to your email!")
                .font(.title2)
                .padding()
            
            Button("Return to Login") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
}
