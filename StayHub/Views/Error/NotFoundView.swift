import SwiftUI

struct NotFoundView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Not Found View")
                .font(.largeTitle)
                .padding()
            
            Text("404")
                .font(.system(size: 100, weight: .bold))
                .padding()
            
            Text("Oops! Page not found")
                .font(.title2)
                .padding()
            
            Button("Back") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            NavigationLink("Home", destination: HomeView(showSideMenu: .constant(false)))
                .padding()
            
            Button("Reload") {
                // Retry logic
            }
            .padding()
        }
    }
}
