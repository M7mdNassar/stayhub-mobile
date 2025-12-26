import SwiftUI

struct GuestSearchResultsView: View {
    @State private var searchParams = SearchParams()
    @State private var hotels = Hotel.sampleHotels
    
    var body: some View {
        VStack(spacing: 0) {
            SearchWidgetView(searchParams: $searchParams)
                .padding()
                .background(Color(.systemBackground))
            
            Divider()
            
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(hotels) { hotel in
                        NavigationLink(destination: GuestHotelDetailsView(hotel: hotel)) {
                            HotelCardFullView(hotel: hotel)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Search Results")
        .navigationBarTitleDisplayMode(.inline)
    }
}
