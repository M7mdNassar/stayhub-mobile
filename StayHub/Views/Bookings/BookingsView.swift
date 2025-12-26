import SwiftUI

struct BookingsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Bookings View")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("List of booking cards here")
                        .padding()
                    
                    NavigationLink("View Booking Details", destination: BookingDetailsView())
                        .padding()
                    
                    NavigationLink("Submit Review", destination: SubmitReviewView())
                        .padding()
                }
            }
            .navigationTitle("My Bookings")
        }
    }
}
