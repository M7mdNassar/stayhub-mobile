import SwiftUI

struct GuestHotelDetailsView: View {
    let hotel: Hotel
    @State private var showingLoginPrompt = false
    
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
                    
                    // Login to Book Button
                    Button(action: {
                        showingLoginPrompt = true
                    }) {
                        Text("Login or Sign Up to Book")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Hotel Details")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingLoginPrompt) {
            LoginSignupPromptView()
        }
    }
}
