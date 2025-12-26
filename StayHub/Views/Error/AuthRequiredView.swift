import SwiftUI

struct AuthRequiredView: View {
    var body: some View {
        VStack {
            Text("Authentication Required View")
                .font(.largeTitle)
                .padding()
            
            Image(systemName: "lock.fill")
                .font(.system(size: 80))
                .padding()
            
            Text("Authentication Required")
                .font(.title2)
                .padding()
            
            NavigationLink("Login", destination: LoginView())
                .buttonStyle(.borderedProminent)
                .padding()
        }
    }
}
