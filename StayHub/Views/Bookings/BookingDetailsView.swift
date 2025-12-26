import SwiftUI
import Foundation

struct BookingDetailsView: View {
    let booking: Booking
    @State private var showingReviewSheet = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                // Hotel Image
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 200)
                    .overlay(
                        Image(systemName: "building.2.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                    )
                    .cornerRadius(12)
                
                // Booking Details
                VStack(alignment: .leading, spacing: 15) {
                    Text("Booking Details")
                        .font(.title2)
                        .bold()
                    
                    DetailRow(icon: "building.2", title: "Hotel", value: booking.hotelName)
                    DetailRow(icon: "bed.double", title: "Room Type", value: booking.roomType)
                    DetailRow(icon: "calendar", title: "Check-in", value: booking.checkInDate.formatted(.dateTime.year().month().day())
)
                    DetailRow(icon: "calendar", title: "Check-out", value: booking.checkOutDate.formatted(.dateTime.year().month().day())
)
                    DetailRow(icon: "dollarsign.circle", title: "Total Cost", value: "$\(Int(booking.totalCost))")
                    DetailRow(icon: "checkmark.seal", title: "Status", value: booking.status.rawValue)
                    DetailRow(icon: "number", title: "Confirmation", value: booking.confirmationNumber)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Actions
                if booking.status == .completed {
                    Button(action: {
                        showingReviewSheet = true
                    }) {
                        Text("Write a Review")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Booking Details")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingReviewSheet) {
            SubmitReviewView(hotelName: booking.hotelName)
        }
    }
}

struct DetailRow: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 24)
                .foregroundColor(.blue)
            Text(title)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .bold()
        }
    }
}
