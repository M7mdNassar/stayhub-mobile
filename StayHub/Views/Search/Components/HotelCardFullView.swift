import SwiftUI

struct HotelCardFullView: View {
    let hotel: Hotel
    
    var body: some View {
        HStack(spacing: 15) {
            // Image
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 120, height: 120)
                .overlay(
                    Image(systemName: "photo")
                        .font(.title)
                        .foregroundColor(.gray)
                )
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(hotel.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                HStack {
                    Image(systemName: "mappin.circle.fill")
                        .font(.caption)
                    Text(hotel.location)
                        .font(.caption)
                }
                .foregroundColor(.secondary)
                
                HStack {
                    ForEach(0..<Int(hotel.rating), id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .font(.caption2)
                            .foregroundColor(.yellow)
                    }
                }
                
                HStack {
                    if let discount = hotel.discount {
                        Text("\(discount)% OFF")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.red)
                            .cornerRadius(4)
                    }
                    
                    Text("$\(Int(hotel.finalPrice))")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
