import SwiftUI

struct LoginView: View {
    @ObservedObject var authViewModel: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        HStack(spacing: 0) {
            // Left Side: Branding / Welcome
            VStack {
                Spacer()
                
                // Placeholder for SLT Logo or Branding
                Text("MySLT")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
                
                Text("Welcome to the self-care portal")
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.8))
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.teal.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            
            // Right Side: Login Form
            VStack(spacing: 24) {
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sign In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Please enter your details to continue.")
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
                
                // Form Fields
                VStack(alignment: .leading, spacing: 16) {
                    // Email
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email Address")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        TextField("name@example.com", text: $email)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(12)
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                            )
                    }
                    
                    // Password
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Password")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        SecureField("••••••••", text: $password)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(12)
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                            )
                    }
                }
                
                // Error Message
                if let errorMessage = authViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                // Login Button
                Button(action: {
                    authViewModel.login(email: email, password: password)
                }) {
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
                    .padding(12)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .buttonStyle(.plain)
                .disabled(authViewModel.isLoading)
                .padding(.top, 10)
                
                Spacer()
            }
            .padding(.horizontal, 60)
            .frame(width: 450, maxHeight: .infinity)
            .background(Color(NSColor.windowBackgroundColor))
        }
        .edgesIgnoringSafeArea(.all)
    }
}
