import Foundation

struct Booking: Codable, Identifiable {
    let id: String
    let confirmationNumber: String
    let hotelName: String
    let roomType: String
    let checkInDate: Date
    let checkOutDate: Date
    let totalCost: Double
    let status: BookingStatus
}

enum BookingStatus: String, Codable {
    case confirmed = "Confirmed"
    case pending = "Pending"
    case cancelled = "Cancelled"
    case completed = "Completed"
}
