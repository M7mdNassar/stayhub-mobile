import SwiftUI

struct HotelDetailsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Hotel Details View")
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
                
                Text("Room Selection")
                    .font(.headline)
                    .padding()
                
                NavigationLink("Add to Cart & Go to Checkout", destination: CheckoutView())
                    .buttonStyle(.borderedProminent)
                    .padding()
                
                NavigationLink("Submit Review", destination: SubmitReviewView())
                    .padding()
            }
        }
        .navigationTitle("Hotel Details")
    }
}
