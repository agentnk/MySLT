import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    // Simulate a login request
    func login(email: String, password: String) {
        isLoading = true
        errorMessage = nil
        
        // Mock network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isLoading = false
            
            // Simple mock validation
            if !email.isEmpty && !password.isEmpty {
                self.isAuthenticated = true
            } else {
                self.errorMessage = "Please enter both email and password."
            }
        }
    }
    
    func logout() {
        isAuthenticated = false
    }
}
