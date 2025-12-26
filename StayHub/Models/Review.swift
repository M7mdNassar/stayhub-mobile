import Foundation

struct Review: Codable, Identifiable {
    let id: String
    let hotelId: String
    let userId: String
    let userName: String
    let rating: Int
    let comment: String
    let createdAt: Date
}
