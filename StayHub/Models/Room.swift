import Foundation

struct Room: Codable, Identifiable {
    let id: String
    let hotelId: String
    let type: String
    let pricePerNight: Double
    let discount: Int?
    let capacity: RoomCapacity
    let amenities: [String]
    let images: [String]
}

struct RoomCapacity: Codable {
    let adults: Int
    let children: Int
}
