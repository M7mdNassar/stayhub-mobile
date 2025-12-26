import SwiftUI

struct RoomCardView: View {
    let room: Room
    let onAddToCart: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 150)
                .overlay(
                    Image(systemName: "bed.double.fill")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                )
                .cornerRadius(12)
            
            Text(room.type)
                .font(.headline)
            
            HStack {
                Image(systemName: "person.2.fill")
                    .font(.caption)
                Text("\(room.capacity.adults) Adults, \(room.capacity.children) Children")
                    .font(.caption)
            }
            .foregroundColor(.secondary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(room.amenities, id: \.self) { amenity in
                        Text(amenity)
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
            }
            
            HStack {
                Text("$\(Int(room.pricePerNight))/night")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.blue)
                
                Spacer()
                
                Button(action: onAddToCart) {
                    Text("Add to Cart")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
