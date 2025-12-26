import Foundation

struct Booking: Codable, Identifiable {
    let id: String
    let confirmationNumber: String
    let userId: String
    let hotelName: String
    let roomNumber: String
    let roomType: String
    let checkInDate: Date
    let checkOutDate: Date
    let totalCost: Double
    let paymentMethod: String
    let status: BookingStatus
    let bookingDateTime: Date
}

enum BookingStatus: String, Codable {
    case confirmed
    case pending
    case cancelled
    case completed
}
