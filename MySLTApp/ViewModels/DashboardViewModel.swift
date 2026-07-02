import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var packageData: PackageData
    @Published var isLoading: Bool = false
    
    init() {
        // Initialize with dummy data matching the screenshot
        self.packageData = PackageData(
            name: "UNLIMITED HOME",
            status: "Active",
            username: "94912291315",
            speed: "NORMAL",
            usedGB: 3.1,
            totalGB: nil, // Unlimited
            validTill: "31-Jul",
            extraGBUsed: 0.7,
            extraGBTotal: 10.0,
            bonusDataUsed: 21.3,
            bonusDataTotal: 21.3,
            payableAmount: 14928.57
        )
    }
    
    // Future integration point for real API
    func fetchLiveAccountData(token: String) {
        isLoading = true
        // TODO: Replace with real URLSession networking call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            // Simulated network response
            self.isLoading = false
        }
    }
}
