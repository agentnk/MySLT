import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DashboardViewModel()
    @State private var selectedTab = "Broadband"
    
    let tabs = ["Broadband", "PEOTV", "Voice", "Mobile", "Promotion"]
    
    var body: some View {
        VStack(spacing: 0) {
            // Top Navigation Bar
            HStack(spacing: 20) {
                ForEach(tabs, id: \.self) { tab in
                    Button(action: {
                        selectedTab = tab
                    }) {
                        Text(tab)
                            .font(.headline)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 24)
                            .background(selectedTab == tab ? Color.white.opacity(0.15) : Color.clear)
                            .cornerRadius(8)
                    }
                    .buttonStyle(.plain)
                }
                Spacer()
            }
            .padding()
            .background(Color.black)
            
            Divider().background(Color.gray.opacity(0.3))
            
            // Sub-navigation & Main Content
            HStack(spacing: 0) {
                // Main Dashboard Area
                DashboardView(viewModel: viewModel)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Divider().background(Color.gray.opacity(0.3))
                
                // Right Panel (Billing & Services)
                RightPanelView(viewModel: viewModel)
                    .frame(width: 320)
            }
        }
        .background(Color(NSColor.windowBackgroundColor))
    }
}
