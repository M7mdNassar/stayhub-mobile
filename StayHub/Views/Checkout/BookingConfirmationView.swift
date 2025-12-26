import SwiftUI

struct BookingConfirmationView: View {
    var body: some View {
        VStack {
            Text("Booking Confirmation View")
                .font(.largeTitle)
                .padding()
            
            Text("Confirmation Details")
                .font(.headline)
                .padding()
            
            Text("Confirmation Number: ABC123")
                .padding()
            
            NavigationLink("Return to Home", destination: HomeView(showSideMenu: .constant(false)))
                .buttonStyle(.borderedProminent)
                .padding()
        }
        .navigationBarBackButtonHidden()
    }
}
