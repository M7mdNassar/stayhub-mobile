import SwiftUI

struct CheckoutRoomCardView: View {
    let item: CartItem
    let onRemove: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 100, height: 80)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(item.room.type)
                        .font(.headline)
                    Text(item.hotel.name)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("$\(Int(item.room.pricePerNight))/night × \(item.nights) nights")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Button(action: onRemove) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .font(.title2)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
