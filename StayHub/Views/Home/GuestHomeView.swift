import SwiftUI

struct GuestHomeView: View {
    @State private var searchParams = SearchParams()
    
    var attributedHeroTitle: AttributedString {
        var result = AttributedString("Explore Our Latest ")
        
        var booking = AttributedString("Booking")
        booking.foregroundColor = .blue
        
        let services = AttributedString(" Services")
        
        result.append(booking)
        result.append(services)
        return result
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    // Hero Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text(attributedHeroTitle)
                            .font(.system(size: 28, weight: .bold))
                        
                        Text("Browse amazing hotels and destinations. Sign in to book!")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    
                    // Search Widget
                    SearchWidgetView(searchParams: $searchParams)
                        .padding(.horizontal)
                    
                    // Featured Deals
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Featured Deals")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(Hotel.sampleHotels) { hotel in
                                    NavigationLink(destination: GuestHotelDetailsView(hotel: hotel)) {
                                        HotelCardView(hotel: hotel)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("StayHub")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        NavigationLink(destination: LoginView()) {
                            Text("Login")
                                .foregroundColor(.blue)
                        }
                        
                        NavigationLink(destination: SignUpView()) {
                            Text("Sign Up")
                                .foregroundColor(.blue)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }
    }
}
