
import Foundation

struct Hotel: Codable, Identifiable {
    let id: String
    let name: String
    let location: String
    let rating: Double
    let images: [String]
    let description: String
    let amenities: [String]
    let coordinates: Coordinates
    let chainName: String?
}

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}
