import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                // 1. SCROLLABLE CONTENT
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: -30) { // Negative spacing pulls the card UP over the image
                        
                        // TOP IMAGE
                        Image("LoginBackground")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.45)
                            .clipped()
                        
                        // LOGIN CARD
                        VStack(spacing: 0) {
                            
                            
                            Text("Welcome Back")
                                .font(.system(size: 28, weight: .bold))
                                .padding(.top, 25)
                            
                            Text("Sign in to continue planning your stay.")
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)
                                .padding(.bottom, 25)
                            
                            // Form Fields
                            VStack(spacing: 18) {
                                inputField(title: "Username or Email", icon: "person.fill", placeholder: "ex. john.doe@example.com", text: $email)
                                passwordField
                                forgotPasswordLink
                            }
                            .padding(.horizontal, 30)
                            
                            loginButton
                                .padding(.horizontal, 30)
                                .padding(.top, 25)
                            
                            // Sign Up Link
                            HStack(spacing: 4) {
                                Text("Don't have an account?").foregroundColor(.secondary)
                                NavigationLink("Create Account", destination: SignUpView())
                                    .fontWeight(.semibold)
                                    .foregroundColor(.cyan)
                            }
                            .font(.system(size: 14))
                            .padding(.vertical, 30)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemBackground))
                        .cornerRadius(30, corners: [.topLeft, .topRight])
                        // Fill the remaining bottom screen space if the content is short
                        .frame(minHeight: geometry.size.height * 0.6)
                    }
                }
                .ignoresSafeArea()
                .background(Color(.systemBackground)) // Ensures bottom of screen is white
                
                // 2. BACK BUTTON (Floating)
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.black.opacity(0.4))
                        .clipShape(Circle())
                }
                .padding(.leading, 20)
                .padding(.top, geometry.safeAreaInsets.top > 0 ? 10 : 20)
            }
        }
        .navigationBarHidden(true)
    }
    
    // MARK: - Components
    private func inputField(title: String, icon: String, placeholder: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.system(size: 13, weight: .medium))
            HStack(spacing: 12) {
                Image(systemName: icon).foregroundColor(.gray).frame(width: 20)
                TextField(placeholder, text: text).font(.system(size: 15))
            }
            .padding().background(Color(.systemGray6)).cornerRadius(12)
        }
    }

    private var passwordField: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Password").font(.system(size: 13, weight: .medium))
            HStack(spacing: 12) {
                Image(systemName: "lock.fill").foregroundColor(.gray).frame(width: 20)
                if showPassword { TextField("Enter your password", text: $password) }
                else { SecureField("Enter your password", text: $password) }
                Button(action: { showPassword.toggle() }) {
                    Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill").foregroundColor(.gray)
                }
            }
            .padding().background(Color(.systemGray6)).cornerRadius(12)
        }
    }

    private var forgotPasswordLink: some View {
        HStack {
                                        Spacer()
                                        NavigationLink(destination: ForgotPasswordInputView()) {
                                            Text("Forgot Password?")
                                                .font(.system(size: 14, weight: .medium))
                                                .foregroundColor(.cyan)
                                        }
                                    }
    }

    private var loginButton: some View {
        Button(action: {
            authManager.login(username: email, password: password)
        }) {
            HStack {
                Text("Log In")
                Image(systemName: "arrow.right")
            }
            .font(.headline).foregroundColor(.white)
            .frame(maxWidth: .infinity).frame(height: 52)
            .background(Color.cyan).cornerRadius(12)
        }
    }
}

// Extension for specific corner rounding
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
#Preview("1. Login/Signup Prompt") {
    LoginView()
}
