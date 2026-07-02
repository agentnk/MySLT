import SwiftUI

struct RightPanelView: View {
    @ObservedObject var viewModel: DashboardViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            
            // Top Grid Buttons
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                RightPanelButton(icon: "plus.square", title: "New Services")
                RightPanelButton(icon: "wifi", title: "Digital Life")
                RightPanelButton(icon: "desktopcomputer", title: "Hot Device")
                RightPanelButton(icon: "doc.text", title: "Bill")
                RightPanelButton(icon: "exclamationmark.bubble", title: "Complaints")
                RightPanelButton(icon: "ellipsis", title: "More")
            }
            
            // Mock Ad Banner
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.1))
                Text("Ad Banner Placeholder")
                    .foregroundColor(.gray)
            }
            .frame(height: 120)
            
            // Billing Section
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Total Payable :")
                        .font(.headline)
                    Spacer()
                    Text("Rs \(String(format: "%.2f", viewModel.packageData.payableAmount))")
                        .font(.headline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(6)
                }
                
                HStack(spacing: 12) {
                    Button(action: {}) {
                        Text("Pay Now")
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: {}) {
                        Text("Bill History")
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
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
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
            
            // Value Added Services
            VStack(alignment: .leading, spacing: 12) {
                Text("Value Added Services")
                    .font(.headline)
                
                HStack(spacing: 16) {
                    ServiceIcon(name: "Duthaya")
                    ServiceIcon(name: "Kaspersky")
                    ServiceIcon(name: "PEO MOBILE")
                    ServiceIcon(name: "SLT Kimaki")
                    ServiceIcon(name: "Storage")
                }
            }
            
            Spacer()
        }
        .padding(24)
        .background(Color.black.opacity(0.2)) // Slightly darker for the sidebar
    }
}

struct RightPanelButton: View {
    var icon: String
    var title: String
    
    var body: some View {
        Button(action: {}) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.title2)
                Text(title)
                    .font(.caption)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(Color.white.opacity(0.05))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}

struct ServiceIcon: View {
    var name: String
    
    var body: some View {
        VStack(spacing: 4) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white.opacity(0.1))
                .frame(width: 40, height: 40)
                .overlay(
                    Text(String(name.prefix(1))) // Initial letter as mock icon
                        .font(.headline)
                )
            Text(name)
                .font(.caption2)
                .multilineTextAlignment(.center)
                .frame(width: 50)
        }
    }
}
