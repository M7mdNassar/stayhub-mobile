import SwiftUI

struct ReviewConfirmedView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Review Confirmed View")
                .font(.largeTitle)
                .padding()
            
            Text("Thank You for Your Review!")
                .font(.title2)
                .padding()
            
            Button("Return to Hotel Details") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
}
