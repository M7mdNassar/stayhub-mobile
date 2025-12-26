import SwiftUI

struct AccessDeniedView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Access Denied View")
                .font(.largeTitle)
                .padding()
            
            Image(systemName: "lock.fill")
                .font(.system(size: 80))
                .padding()
            
            Text("Additional Access Required")
                .font(.title2)
                .padding()
            
            Button("Back") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            NavigationLink("Home", destination: HomeView(showSideMenu: .constant(false)))
                .padding()
        }
    }
}
