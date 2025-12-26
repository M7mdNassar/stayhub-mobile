import SwiftUI

struct BookingDetailsView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Booking Details View")
                    .font(.largeTitle)
                    .padding()
                
                Text("Detailed booking information here")
                    .padding()
            }
        }
        .navigationTitle("Booking Details")
    }
}
