import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var viewModel = DashboardViewModel()
    @State private var selectedTab = "Broadband"
    
    let tabs = ["Broadband", "PEOTV", "Voice", "Mobile", "Promotion"]
    
    var body: some View {
        VStack(spacing: 0) {
            // Top Navigation Bar
            HStack(spacing: 12) {
                ForEach(tabs, id: \.self) { tab in
                    Button(action: { selectedTab = tab }) {
                        HStack(spacing: 6) {
                            Image(systemName: iconName(for: tab))
                                .font(.system(size: 14))
                            Text(tab)
                                .font(.system(size: 13, weight: .semibold))
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 18)
                        .background(selectedTab == tab ? Color.sltBrightBlue : Color.sltMedBlue)
                        .cornerRadius(8)
                    }
                    .buttonStyle(.plain)
                    .foregroundColor(.white)
                }
                Spacer()
                Button(action: { authViewModel.logout() }) {
                    Text("Log Out")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 14)
                        .background(Color.red.opacity(0.8))
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.sltNavyBg)
            
            // Main Content
            HStack(spacing: 0) {
                DashboardView(viewModel: viewModel)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Divider()
                    .background(Color.sltMedBlue)
                
                RightPanelView(viewModel: viewModel)
                    .frame(width: 320)
            }
        }
        .background(Color.sltNavyBg)
    }
    
    func iconName(for tab: String) -> String {
        switch tab {
        case "Broadband": return "wifi"
        case "PEOTV":     return "tv"
        case "Voice":     return "phone"
        case "Mobile":    return "iphone"
        case "Promotion": return "megaphone"
        default:          return "circle"
        }
    }
}
