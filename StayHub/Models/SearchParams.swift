import Foundation

struct SearchParams: Codable {
    var destination: String
    var checkIn: Date
    var checkOut: Date
    var adults: Int
    var children: Int
    var rooms: Int
    var sortBy: SortOption
    var minStars: Int
}

enum SortOption: String, Codable {
    case rating
    case price
    case distance
}
