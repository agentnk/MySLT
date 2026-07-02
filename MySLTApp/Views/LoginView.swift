import SwiftUI

struct LoginView: View {
    @ObservedObject var authViewModel: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        HStack(spacing: 0) {
            // Left Side: Branding
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.sltNavyBg, Color.sltBrightBlue.opacity(0.7)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
                VStack(alignment: .leading, spacing: 12) {
                    Spacer()
                    Image(systemName: "wifi.circle.fill")
                        .font(.system(size: 56))
                        .foregroundColor(.white.opacity(0.9))
                    Text("MySLT")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)
                    Text("Welcome to the self-care portal")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.75))
                    Spacer()
                }
                .padding(40)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Right Side: Login Form
            VStack(spacing: 0) {
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sign In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("Enter your MySLT credentials to continue.")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.55))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 28)
                
                // Email Field
                VStack(alignment: .leading, spacing: 7) {
                    Text("Email / Username")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white.opacity(0.6))
                    TextField("name@example.com", text: $email)
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.sltDarkCard)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.sltMedBlue, lineWidth: 1)
                        )
                }
                
                Spacer().frame(height: 16)
                
                // Password Field
                VStack(alignment: .leading, spacing: 7) {
                    Text("Password")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white.opacity(0.6))
                    SecureField("••••••••", text: $password)
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.sltDarkCard)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.sltMedBlue, lineWidth: 1)
                        )
                }
                
                // Error
                if let errorMessage = authViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 8)
                }
                
                Spacer().frame(height: 24)
                
                // Sign In Button
                Button(action: { authViewModel.login(email: email, password: password) }) {
                    HStack {
                        Spacer()
                        if authViewModel.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(0.8)
                        } else {
                            Text("Sign In")
                                .fontWeight(.semibold)
                        }
                        Spacer()
                    }
                    .padding(13)
                    .background(Color.sltBrightBlue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .buttonStyle(.plain)
                .disabled(authViewModel.isLoading)
                
                Spacer()
            }
            .padding(.horizontal, 50)
            .frame(width: 420, maxHeight: .infinity)
            .background(Color.sltNavyBg)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
