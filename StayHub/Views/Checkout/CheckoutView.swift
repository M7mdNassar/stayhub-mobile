import SwiftUI

struct CheckoutView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Checkout View")
                    .font(.largeTitle)
                    .padding()
                
                Text("Selected Rooms")
                    .font(.headline)
                    .padding()
                
                Text("Payment Information Form")
                    .font(.headline)
                    .padding()
                
                Text("Cart Summary")
                    .font(.headline)
                    .padding()
                
                NavigationLink("Book Now", destination: BookingConfirmationView())
                    .buttonStyle(.borderedProminent)
                    .padding()
            }
        }
        .navigationTitle("Checkout")
    }
}
