
import Foundation

struct Hotel: Codable, Identifiable {
    let id: String
    let name: String
    let location: String
    let rating: Double
    let images: [String]
    let description: String
    let amenities: [String]
    let pricePerNight: Double
    let discount: Int?
    let chainName: String?
    
    var finalPrice: Double {
        if let discount = discount {
            return pricePerNight * (1.0 - Double(discount) / 100.0)
        }
        return pricePerNight
    }
}
