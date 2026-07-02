import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: DashboardViewModel
    @State private var selectedSubTab = "Summary"
    let subTabs = ["Summary", "Daily Usage", "Gift Data", "History", "Redeem Data", "Happy Day", "More"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // Sub-Tab Bar
            HStack(spacing: 0) {
                ForEach(subTabs, id: \.self) { tab in
                    Button(action: { selectedSubTab = tab }) {
                        Text(tab)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.vertical, 9)
                            .padding(.horizontal, 14)
                            .background(selectedSubTab == tab ? Color.sltBrightBlue : Color.clear)
                            .cornerRadius(6)
                    }
                    .buttonStyle(.plain)
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
            .background(Color.sltSubTabBg)
            
            // Package Info & Action Buttons
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Package : \(viewModel.packageData.name)")
                        .font(.system(size: 12, weight: .semibold))
                    Text("Status : \(viewModel.packageData.status)")
                        .font(.system(size: 12))
                    Text("Username : \(viewModel.packageData.username)")
                        .font(.system(size: 12))
                }
                .foregroundColor(.white)
                
                Spacer()
                
                HStack(spacing: 10) {
                    SLTActionButton(title: "Package Upgrade")
                    SLTActionButton(title: "Get Extra GB")
                    SLTActionButton(title: "Get data Add-ons")
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.sltNavyBg)
            
            // Main Content Area
            HStack(alignment: .top, spacing: 0) {
                
                // Left Usage Cards
                VStack(spacing: 8) {
                    SLTUsageCard(title: "My Package", subtitle: "\(viewModel.packageData.usedGB) used from GB", isSelected: true)
                    SLTUsageCard(title: "Extra GB", subtitle: "\(viewModel.packageData.extraGBUsed) used from \(viewModel.packageData.extraGBTotal)GB")
                    SLTUsageCard(title: "Bonus Data", subtitle: "\(viewModel.packageData.bonusDataUsed) used from \(viewModel.packageData.bonusDataTotal)GB")
                    SLTUsageCard(title: "Add-Ons Data", subtitle: "N/A")
                    SLTUsageCard(title: "Free Data", subtitle: "N/A")
                    Spacer()
                }
                .frame(width: 160)
                .padding(12)
                .background(Color.sltNavyBg)
                
                // Center Panel
                VStack(spacing: 16) {
                    Spacer()
                    
                    HStack(spacing: 6) {
                        Text("Your speed is")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                        Text(viewModel.packageData.speed)
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color.sltBrightBlue)
                            .cornerRadius(12)
                        Text("right now")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                    
                    Text("Total Usage")
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.6))
                    
                    // Big GB display
                    VStack(spacing: 4) {
                        Text("\(String(format: "%.1f", viewModel.packageData.usedGB))GB")
                            .font(.system(size: 56, weight: .bold))
                            .foregroundColor(Color(red: 0.55, green: 0.45, blue: 0.90))
                        Text("used")
                            .font(.system(size: 16))
                            .foregroundColor(.white.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 4) {
                        Text("\(String(format: "%.1f", viewModel.packageData.usedGB)) GB USED OF UNLIMITED")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                        Text("(Valid Till : \(viewModel.packageData.validTill))")
                            .font(.system(size: 12))
                            .foregroundColor(Color.sltBrightBlue)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.sltDarkCard)
                .padding(12)
            }
            .frame(maxHeight: .infinity)
        }
        .background(Color.sltNavyBg)
    }
}

// MARK: - Reusable Components

struct SLTActionButton: View {
    var title: String
    var body: some View {
        Button(action: {}) {
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.sltLightBlue)
                .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }
}

struct SLTUsageCard: View {
    var title: String
    var subtitle: String
    var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 3) {
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(isSelected ? .white : .white.opacity(0.85))
            Text(subtitle)
                .font(.system(size: 10))
                .foregroundColor(isSelected ? .white.opacity(0.85) : .white.opacity(0.55))
                .multilineTextAlignment(.center)
        }
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(isSelected ? Color.sltBrightBlue : Color.sltDarkCard)
        .cornerRadius(8)
    }
}
