import SwiftUI

struct BookingsView: View {
    @State private var bookings = Booking.sampleBookings
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if bookings.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "calendar.badge.exclamationmark")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("No Bookings Yet")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("Your hotel reservations will appear here")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 100)
                } else {
                    LazyVStack(spacing: 15) {
                        ForEach(bookings) { booking in
                            NavigationLink(destination: BookingDetailsView(booking: booking)) {
                                BookingCardView(booking: booking)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("My Bookings")
        }
    }
}
