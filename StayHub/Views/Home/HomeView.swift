import SwiftUI

struct HomeView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var showSideMenu = false
    @State private var searchParams = SearchParams()
    @State private var recentlyViewed = Hotel.sampleHotels
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .leading) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 25) {
                        // Hero Section
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Explore Our Latest")
                                .font(.system(size: 28, weight: .bold))
                            + Text(" Booking")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.blue)
                            + Text(" Services")
                                .font(.system(size: 28, weight: .bold))
                            
                            Text("Discover and book tailored services with StayHub. From vacation rentals to event venues, enjoy a seamless booking experience.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        
                        // Search Widget
                        SearchWidgetView(searchParams: $searchParams)
                            .padding(.horizontal)
                        
                        // Recently Viewed Hotels
                        if !recentlyViewed.isEmpty {
                            VStack(alignment: .leading, spacing: 15) {
                                HStack {
                                    Text("Recently Viewed Hotels")
                                        .font(.title2)
                                        .bold()
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        recentlyViewed.removeAll()
                                    }) {
                                        Text("Clear All")
                                            .font(.subheadline)
                                            .foregroundColor(.blue)
                                    }
                                }
                                .padding(.horizontal)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 15) {
                                        ForEach(recentlyViewed) { hotel in
                                            NavigationLink(destination: HotelDetailsView(hotel: hotel)) {
                                                HotelCardView(hotel: hotel)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                        
                        // Featured Deals
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Featured Deals")
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(Hotel.sampleHotels) { hotel in
                                        NavigationLink(destination: HotelDetailsView(hotel: hotel)) {
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
                
                // Side Navigation Drawer
                if showSideMenu {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                showSideMenu = false
                            }
                        }
                    
                    SideNavigationDrawerView(isShowing: $showSideMenu)
                        .transition(.move(edge: .leading))
                }
            }
            .navigationTitle("StayHub")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation {
                            showSideMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.primary)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CheckoutView()) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "cart")
                                .foregroundColor(.primary)
                            
                            if cartManager.itemCount > 0 {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 16, height: 16)
                                    .overlay(
                                        Text("\(cartManager.itemCount)")
                                            .font(.system(size: 10, weight: .bold))
                                            .foregroundColor(.white)
                                    )
                                    .offset(x: 8, y: -8)
                            }
                        }
                    }
                }
            }
        }
    }
}
