import SwiftUI

struct SubmitReviewView: View {
    @State private var rating = 0
    @State private var reviewText = ""
    @State private var navigateToConfirmation = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Submit Review View")
                .font(.largeTitle)
                .padding()
            
            Text("Star Rating Input (1-5)")
                .padding()
            
            TextEditor(text: $reviewText)
                .frame(height: 150)
                .border(Color.gray)
                .padding()
            
            Button("Submit Review") {
                // API call
                navigateToConfirmation = true
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            Button("Cancel") {
                dismiss()
            }
            .padding()
            
            NavigationLink("", destination: ReviewConfirmedView(), isActive: $navigateToConfirmation)
                .hidden()
        }
        .navigationTitle("Write a Review")
    }
}
