import Foundation

struct Cart: Codable {
    var items: [CartItem]
    
    var totalCost: Double {
        items.reduce(0) { $0 + $1.totalPrice }
    }
    
    var itemCount: Int {
        items.count
    }
}

struct CartItem: Codable, Identifiable {
    let id: String
    let room: Room
    let nights: Int
    
    var totalPrice: Double {
        let basePrice = room.pricePerNight * Double(nights)
        if let discount = room.discount {
            return basePrice * (1.0 - Double(discount) / 100.0)
        }
        return basePrice
    }
}
