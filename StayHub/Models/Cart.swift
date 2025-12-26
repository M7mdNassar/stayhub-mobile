import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let room: Room
    let hotel: Hotel
    let nights: Int
    
    var totalPrice: Double {
        let basePrice = room.pricePerNight * Double(nights)
        if let discount = room.discount {
            return basePrice * (1.0 - Double(discount) / 100.0)
        }
        return basePrice
    }
}
