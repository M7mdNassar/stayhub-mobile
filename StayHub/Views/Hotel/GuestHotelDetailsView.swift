import SwiftUI

struct GuestHotelDetailsView: View {
    @State private var showLoginPrompt = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Guest Hotel Details View")
                    .font(.largeTitle)
                    .padding()
                
                Text("Image Gallery")
                    .font(.headline)
                    .padding()
                
                Text("Hotel Information")
                    .font(.headline)
                    .padding()
                
                Text("Amenities List")
                    .font(.headline)
                    .padding()
                
                Text("Map View")
                    .font(.headline)
                    .padding()
                
                Text("Reviews Section")
                    .font(.headline)
                    .padding()
                
                Button("Login or Sign Up to Book") {
                    showLoginPrompt = true
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .navigationTitle("Hotel Details")
        .sheet(isPresented: $showLoginPrompt) {
            LoginSignupPromptView()
        }
    }
}
