import SwiftUI

struct SearchResultsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Search Results View")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("Search Bar Here")
                        .padding()
                    
                    Text("Hotel Grid/List Here")
                        .padding()
                    
                    NavigationLink("Go to Hotel Details", destination: HotelDetailsView())
                        .padding()
                }
            }
            .navigationTitle("Search Results")
        }
    }
}
