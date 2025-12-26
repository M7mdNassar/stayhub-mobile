import SwiftUI

struct SubmitReviewView: View {
    let hotelName: String
    @Environment(\.dismiss) private var dismiss
    @State private var rating = 5
    @State private var reviewText = ""
    @State private var navigateToConfirmation = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                Text("Review \(hotelName)")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                // Star Rating
                VStack(spacing: 10) {
                    Text("Your Rating")
                        .font(.headline)
                    
                    HStack(spacing: 15) {
                        ForEach(1...5, id: \.self) { star in
                            Image(systemName: star <= rating ? "star.fill" : "star")
                                .font(.largeTitle)
                                .foregroundColor(star <= rating ? .yellow : .gray)
                                .onTapGesture {
                                    rating = star
                                }
                        }
                    }
                }
                
                // Review Text
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your Review")
                        .font(.headline)
                    
                    TextEditor(text: $reviewText)
                        .frame(height: 150)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                }
                
                Spacer()
                
                Button(action: {
                    navigateToConfirmation = true
                }) {
                    Text("Submit Review")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationDestination(isPresented: $navigateToConfirmation) {
                ReviewConfirmedView()
            }
        }
    }
}
