import SwiftUI

struct RightPanelView: View {
    @ObservedObject var viewModel: DashboardViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            
            // Top Grid Buttons (3x2)
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                SLTGridButton(icon: "plus.square.fill",      title: "New Services")
                SLTGridButton(icon: "wifi",                  title: "Digital Life")
                SLTGridButton(icon: "desktopcomputer",       title: "Hot Device")
                SLTGridButton(icon: "doc.text.fill",         title: "Bill")
                SLTGridButton(icon: "exclamationmark.bubble.fill", title: "Complaints")
                SLTGridButton(icon: "ellipsis",              title: "More")
            }
            
            // Ad Banner Placeholder
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.sltDarkCard)
                VStack(spacing: 6) {
                    Image(systemName: "play.rectangle.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color.sltBrightBlue.opacity(0.7))
                    Text("Promotions & Offers")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.5))
                }
            }
            .frame(height: 100)
            
            // Billing Section
            VStack(spacing: 10) {
                HStack {
                    Text("Total Payable :")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                    Text("Rs \(String(format: "%.2f", viewModel.packageData.payableAmount))")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.sltGreen)
                        .cornerRadius(6)
                }
                
                HStack(spacing: 8) {
                    Button(action: {}) {
                        Text("Pay Now")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(Color.sltGreen)
                            .cornerRadius(7)
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: {}) {
                        Text("Bill History")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(Color.sltGreen.opacity(0.6))
                            .cornerRadius(7)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(12)
            .background(Color.sltDarkCard)
            .cornerRadius(10)
            
            // Value Added Services
            VStack(alignment: .leading, spacing: 10) {
                Text("Value Added Services")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.white)
                
                HStack(spacing: 12) {
                    SLTServiceIcon(initial: "D", name: "Duthaya")
                    SLTServiceIcon(initial: "K", name: "Kaspersky")
                    SLTServiceIcon(initial: "P", name: "PEO\nMOBILE")
                    SLTServiceIcon(initial: "S", name: "SLT\nKimaki")
                    SLTServiceIcon(initial: "C", name: "Storage")
                }
            }
            
            Spacer()
        }
        .padding(16)
        .background(Color.sltNavyBg)
    }
}

// MARK: - Right Panel Components

struct SLTGridButton: View {
    var icon: String
    var title: String
    
    var body: some View {
        Button(action: {}) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(Color.sltBrightBlue)
                Text(title)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(.white.opacity(0.85))
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(Color.sltDarkCard)
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }
}

struct SLTServiceIcon: View {
    var initial: String
    var name: String
    
    var body: some View {
        VStack(spacing: 5) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.sltLightBlue)
                    .frame(width: 42, height: 42)
                Text(initial)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
            Text(name)
                .font(.system(size: 9))
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)
                .frame(width: 44)
        }
    }
}
