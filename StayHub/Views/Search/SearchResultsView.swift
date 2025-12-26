import SwiftUI

struct SearchResultsView: View {
    @State private var searchParams = SearchParams()
    @State private var hotels = Hotel.sampleHotels
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Search Bar
                SearchWidgetView(searchParams: $searchParams)
                    .padding()
                    .background(Color(.systemBackground))
                
                Divider()
                
                // Results
                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach(hotels) { hotel in
                            NavigationLink(destination: HotelDetailsView(hotel: hotel)) {
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
}
