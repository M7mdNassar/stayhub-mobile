import SwiftUI

struct BookingCardView: View {
    let booking: Booking
    
    var statusColor: Color {
        switch booking.status {
        case .confirmed: return .green
        case .pending: return .orange
        case .cancelled: return .red
        case .completed: return .blue
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(booking.hotelName)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                Text(booking.status.rawValue)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(statusColor)
                    .cornerRadius(8)
            }
            
            Text(booking.roomType)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.blue)
                Text("\(booking.checkInDate, style: .date) - \(booking.checkOutDate, style: .date)")
                    .font(.caption)
            }
            
            HStack {
                Text("$\(Int(booking.totalCost))")
                    .font(.headline)
                    .foregroundColor(.blue)
                Spacer()
                Text("Confirmation: \(booking.confirmationNumber)")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
