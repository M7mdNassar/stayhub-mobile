import SwiftUI

struct HotelDetailsView: View {
    let hotel: Hotel
    @EnvironmentObject var cartManager: CartManager
    @State private var selectedRooms: [Room] = []
    @State private var showingReviewSheet = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Image Gallery
                TabView {
                    ForEach(0..<3, id: \.self) { index in
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 250)
                            .overlay(
                                Image(systemName: "photo")
                                    .font(.system(size: 60))
                                    .foregroundColor(.gray)
                            )
                    }
                }
                .frame(height: 250)
                .tabViewStyle(.page(indexDisplayMode: .always))
                
                VStack(alignment: .leading, spacing: 15) {
                    // Hotel Info
                    HStack {
                        Text(hotel.name)
                            .font(.title)
                            .bold()
                        Spacer()
                        HStack {
                            ForEach(0..<Int(hotel.rating), id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                    
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                        Text(hotel.location)
                            .foregroundColor(.secondary)
                    }
                    
                    Text(hotel.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    // Amenities
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Amenities")
                            .font(.headline)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                            ForEach(hotel.amenities, id: \.self) { amenity in
                                HStack {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                    Text(amenity)
                                        .font(.subheadline)
                                    Spacer()
                                }
                            }
                        }
                    }
                    
                    // Map Placeholder
                    VStack(alignment: .leading) {
                        Text("Location")
                            .font(.headline)
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 200)
                            .overlay(
                                VStack {
                                    Image(systemName: "map.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.gray)
                                    Text("Map View")
                                        .foregroundColor(.secondary)
                                }
                            )
                            .cornerRadius(12)
                    }
                    
                    // Reviews
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Reviews")
                            .font(.headline)
                        
                        ForEach(Review.sampleReviews) { review in
                            ReviewCardView(review: review)
                        }
                        
                        Button(action: {
                            showingReviewSheet = true
                        }) {
                            Text("Write a Review")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(12)
                        }
                    }
                    
                    // Room Selection
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Select Room")
                            .font(.headline)
                        
                        ForEach(Room.sampleRooms) { room in
                            RoomCardView(room: room) {
                                let cartItem = CartItem(room: room, hotel: hotel, nights: 1)
                                cartManager.addItem(cartItem)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Hotel Details")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingReviewSheet) {
            SubmitReviewView(hotelName: hotel.name)
        }
    }
}
