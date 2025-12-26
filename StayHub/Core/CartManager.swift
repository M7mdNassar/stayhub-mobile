import SwiftUI
import Combine

@MainActor
class CartManager: ObservableObject {
    @Published var items: [CartItem] = []
    
    var itemCount: Int {
        items.count
    }
    
    var totalCost: Double {
        items.reduce(0) { $0 + $1.totalPrice }
    }
    
    func addItem(_ item: CartItem) {
        items.append(item)
    }
    
    func removeItem(at index: Int) {
        items.remove(at: index)
    }
    
    func clearCart() {
        items.removeAll()
    }
}

