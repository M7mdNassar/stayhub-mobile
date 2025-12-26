import SwiftUI

struct HotelCardView: View {
    let hotel: Hotel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Image
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 280, height: 180)
                .overlay(
                    Image(systemName: "photo")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                )
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 5) {
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
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.red)
                            .cornerRadius(4)
                    }
                    
                    Text("$\(Int(hotel.finalPrice))")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal, 8)
        }
        .frame(width: 280)
    }
}
