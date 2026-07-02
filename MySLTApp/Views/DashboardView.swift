import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: DashboardViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            // Sub Tabs
            HStack(spacing: 16) {
                let subTabs = ["Summary", "Daily Usage", "Gift Data", "History", "Redeem Data", "Happy Day", "More"]
                ForEach(subTabs, id: \.self) { tab in
                    Text(tab)
                        .font(.subheadline)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(tab == "Summary" ? Color.white : Color.clear)
                        .foregroundColor(tab == "Summary" ? .black : .white)
                        .cornerRadius(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.white.opacity(0.3), lineWidth: tab != "Summary" ? 1 : 0)
                        )
                }
            }
            
            // Package Info & Action Buttons
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Package : \(viewModel.packageData.name)")
                    Text("Status : \(viewModel.packageData.status)")
                    Text("Username : \(viewModel.packageData.username)")
                }
                .font(.subheadline)
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                Spacer()
                
                HStack(spacing: 12) {
                    ActionButton(title: "Package Upgrade")
                    ActionButton(title: "Get Extra GB")
                    ActionButton(title: "Get data Add-ons")
                }
            }
            
            // Usage Details and Circle
            HStack(spacing: 24) {
                // Left Usage List
                VStack(spacing: 12) {
                    UsageCard(title: "My Package", value: "\(viewModel.packageData.usedGB) used from GB", isSelected: true)
                    UsageCard(title: "Extra GB", value: "\(viewModel.packageData.extraGBUsed) used from \(viewModel.packageData.extraGBTotal)GB")
                    UsageCard(title: "Bonus Data", value: "\(viewModel.packageData.bonusDataUsed) used from \(viewModel.packageData.bonusDataTotal)GB")
                    UsageCard(title: "Add-Ons Data", value: "N/A")
                    UsageCard(title: "Free Data", value: "N/A")
                }
                .frame(width: 200)
                
                // Center Circle
                VStack(spacing: 16) {
                    HStack {
                        Text("Your speed is")
                        Text(viewModel.packageData.speed)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(12)
                        Text("right now")
                    }
                    .font(.title3)
                    
                    Text("Total Usage")
                        .foregroundColor(.gray)
                    
                    UsageCircleView(usedGB: viewModel.packageData.usedGB)
                        .frame(width: 200, height: 200)
                    
                    VStack(spacing: 4) {
                        Text("\(String(format: "%.1f", viewModel.packageData.usedGB)) GB USED OF UNLIMITED")
                            .font(.headline)
                        Text("(Valid Till : \(viewModel.packageData.validTill))")
                            .foregroundColor(.gray)
                            .font(.footnote)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            
            Spacer()
        }
        .padding(24)
    }
}

// Reusable Components

struct ActionButton: View {
    var title: String
    var body: some View {
        Button(action: {}) {
            Text(title)
                .fontWeight(.medium)
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .background(Color.white.opacity(0.1))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                )
        }
        .buttonStyle(.plain)
    }
}

struct UsageCard: View {
    var title: String
    var value: String
    var isSelected: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Text(title)
                .font(.headline)
                .foregroundColor(isSelected ? .black : .white)
            Text(value)
                .font(.caption)
                .foregroundColor(isSelected ? .black.opacity(0.7) : .gray)
        }
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .background(isSelected ? Color.white : Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}
