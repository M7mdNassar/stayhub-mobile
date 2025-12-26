import SwiftUI

struct GuestSearchResultsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Guest Search Results View")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("Hotel Grid/List Here")
                        .padding()
                    
                    NavigationLink("Go to Guest Hotel Details", destination: GuestHotelDetailsView())
                        .padding()
                }
            }
            .navigationTitle("Search Results")
        }
    }
}
