import SwiftUI

struct LoginView: View {
    @ObservedObject var authViewModel: AuthViewModel
    
    @State private var userID = ""
    @State private var password = ""
    @State private var rememberMe = true
    @State private var showPassword = false
    
    var body: some View {
        HStack(spacing: 0) {
            
            // ── LEFT PANEL ───────────────────────────────────────────────
            VStack(alignment: .leading, spacing: 0) {
                
                // SLT Logo
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 4) {
                        // Stylised lightning bolt icon
                        Text("//")
                            .font(.system(size: 22, weight: .black))
                            .foregroundColor(Color.sltBrightBlue)
                        HStack(spacing: 0) {
                            Text("SLT")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                            Text("MOBITEL")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color(red: 0.22, green: 0.78, blue: 0.22))
                        }
                    }
                    Text("The Connection")
                        .font(.system(size: 10, weight: .regular))
                        .foregroundColor(.white.opacity(0.55))
                        .padding(.leading, 28)
                }
                .padding(.bottom, 40)
                
                // Heading
                Text("Welcome Back")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.white)
                Text("Sign in to manage your SLT services")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.55))
                    .padding(.top, 4)
                    .padding(.bottom, 28)
                
                // User ID Field
                VStack(alignment: .leading, spacing: 7) {
                    HStack(spacing: 3) {
                        Text("User ID")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                        Text("*")
                            .foregroundColor(.red)
                            .font(.system(size: 13, weight: .bold))
                    }
                    
                    HStack(spacing: 10) {
                        Image(systemName: "person")
                            .foregroundColor(.white.opacity(0.4))
                            .frame(width: 18)
                        TextField("Email or mobile number", text: $userID)
                            .textFieldStyle(PlainTextFieldStyle())
                            .foregroundColor(.white)
                            .font(.system(size: 13))
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 13)
                    .background(Color.sltDarkCard)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.sltMedBlue, lineWidth: 1)
                    )
                }
                .padding(.bottom, 16)
                
                // Password Field
                VStack(alignment: .leading, spacing: 7) {
                    HStack(spacing: 3) {
                        Text("Password")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                        Text("*")
                            .foregroundColor(.red)
                            .font(.system(size: 13, weight: .bold))
                    }
                    
                    HStack(spacing: 10) {
                        Image(systemName: "lock")
                            .foregroundColor(.white.opacity(0.4))
                            .frame(width: 18)
                        
                        if showPassword {
                            TextField("Enter your password", text: $password)
                                .textFieldStyle(PlainTextFieldStyle())
                                .foregroundColor(.white)
                                .font(.system(size: 13))
                        } else {
                            SecureField("Enter your password", text: $password)
                                .textFieldStyle(PlainTextFieldStyle())
                                .foregroundColor(.white)
                                .font(.system(size: 13))
                        }
                        
                        Button(action: { showPassword.toggle() }) {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundColor(.white.opacity(0.4))
                                .font(.system(size: 14))
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 13)
                    .background(Color.sltDarkCard)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.sltMedBlue, lineWidth: 1)
                    )
                }
                .padding(.bottom, 14)
                
                // Remember Me + Forgot Password
                HStack {
                    Toggle(isOn: $rememberMe) {
                        Text("Remember Me")
                            .font(.system(size: 12))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Forgot Password?")
                            .font(.system(size: 12))
                            .foregroundColor(Color.sltBrightBlue)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.bottom, 20)
                
                // Error Message
                if let errorMessage = authViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.bottom, 8)
                }
                
                // Sign In Button
                Button(action: { authViewModel.login(email: userID, password: password) }) {
                    HStack {
                        Spacer()
                        if authViewModel.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(0.8)
                        } else {
                            Text("Sign In")
                                .font(.system(size: 15, weight: .semibold))
                        }
                        Spacer()
                    }
                    .padding(.vertical, 14)
                    .background(Color.sltBrightBlue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .buttonStyle(.plain)
                .disabled(authViewModel.isLoading)
                
                Spacer()
                
                // Version + Online status
                HStack(spacing: 8) {
                    Text("Version 1.0.0")
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.35))
                    
                    Rectangle()
                        .frame(width: 1, height: 12)
                        .foregroundColor(.white.opacity(0.2))
                    
                    Circle()
                        .fill(Color.green)
                        .frame(width: 7, height: 7)
                    
                    Text("Online")
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.35))
                }
            }
            .padding(40)
            .frame(width: 460, maxHeight: .infinity)
            .background(Color.sltNavyBg)
            
            // ── RIGHT PANEL ──────────────────────────────────────────────
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(red: 0.02, green: 0.10, blue: 0.22), location: 0.0),
                        .init(color: Color(red: 0.05, green: 0.30, blue: 0.12), location: 0.5),
                        .init(color: Color(red: 0.02, green: 0.10, blue: 0.22), location: 1.0)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
                // Green speed lines (decorative)
                Canvas { context, size in
                    for i in 0..<18 {
                        let y = CGFloat(i) * (size.height / 18)
                        var path = Path()
                        path.move(to: CGPoint(x: 0, y: y))
                        path.addLine(to: CGPoint(x: size.width, y: y + CGFloat(i % 3) * 8))
                        context.stroke(path, with: .color(Color.green.opacity(0.05 + Double(i % 3) * 0.02)), lineWidth: 1)
                    }
                }
                
                VStack {
                    Spacer()
                    
                    // Marketing text
                    VStack(alignment: .leading, spacing: 6) {
                        Text("FASTEST")
                            .font(.system(size: 40, weight: .black))
                            .foregroundColor(.white)
                        Text("MOST STABLE")
                            .font(.system(size: 40, weight: .black))
                            .foregroundColor(.white)
                        HStack(spacing: 12) {
                            Text("UNSTOPPABLE")
                                .font(.system(size: 36, weight: .black))
                                .foregroundColor(.white)
                            Text("FibreOn")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(Color(red: 0.13, green: 0.65, blue: 0.13))
                                .cornerRadius(6)
                        }
                    }
                    .padding(.bottom, 40)
                    
                    // Mascot placeholder
                    ZStack {
                        Ellipse()
                            .fill(Color.green.opacity(0.15))
                            .frame(width: 180, height: 60)
                            .blur(radius: 20)
                            .offset(y: 60)
                        
                        Image(systemName: "bolt.fill")
                            .font(.system(size: 80, weight: .black))
                            .foregroundStyle(
                                LinearGradient(colors: [Color.yellow, Color.orange], startPoint: .top, endPoint: .bottom)
                            )
                    }
                    .frame(height: 160)
                    
                    Spacer()
                    
                    // Bottom branding
                    VStack(spacing: 3) {
                        HStack(spacing: 4) {
                            Text("//")
                                .font(.system(size: 18, weight: .black))
                                .foregroundColor(Color.sltBrightBlue)
                            HStack(spacing: 0) {
                                Text("SLT")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                                Text("MOBITEL")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(Color(red: 0.22, green: 0.78, blue: 0.22))
                            }
                        }
                        Text("The Connection")
                            .font(.system(size: 10))
                            .foregroundColor(.white.opacity(0.55))
                    }
                    .padding(.bottom, 24)
                    
                    // Dot indicators
                    HStack(spacing: 6) {
                        Circle().fill(Color.sltBrightBlue).frame(width: 7, height: 7)
                        Circle().fill(Color.white.opacity(0.4)).frame(width: 7, height: 7)
                        Circle().fill(Color.white.opacity(0.4)).frame(width: 7, height: 7)
                    }
                    .padding(.bottom, 28)
                }
                .padding(40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - Custom Checkbox Toggle Style

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8) {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(configuration.isOn ? Color.sltBrightBlue : Color.sltDarkCard)
                    .frame(width: 16, height: 16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.sltMedBlue, lineWidth: 1)
                    )
                if configuration.isOn {
                    Image(systemName: "checkmark")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            .onTapGesture { configuration.isOn.toggle() }
            
            configuration.label
        }
    }
}
