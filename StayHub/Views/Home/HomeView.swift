import SwiftUI

struct HomeView: View {
    @Binding var showSideMenu: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Home View")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("Search Widget Here")
                        .padding()
                    
                    Text("Recently Viewed Hotels")
                        .font(.headline)
                        .padding()
                    
                    Text("Featured Deals")
                        .font(.headline)
                        .padding()
                    
                    NavigationLink("Go to Hotel Details", destination: HotelDetailsView())
                        .padding()
                }
            }
            .navigationTitle("StayHub")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showSideMenu.toggle() }) {
                        Image(systemName: "line.3.horizontal")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CheckoutView()) {
                        Image(systemName: "cart")
                    }
                }
            }
        }
    }
}
