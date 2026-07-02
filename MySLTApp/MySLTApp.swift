import SwiftUI

@main
struct MySLTApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authViewModel.isAuthenticated {
                    ContentView()
                        .environmentObject(authViewModel)
                } else {
                    LoginView(authViewModel: authViewModel)
                }
            }
            .frame(minWidth: 1000, minHeight: 650)
            .preferredColorScheme(.dark)
        }
        .windowStyle(.hiddenTitleBar)
    }
}
