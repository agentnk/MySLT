import Foundation

struct PackageData {
    var name: String
    var status: String
    var username: String
    var speed: String
    
    var usedGB: Double
    var totalGB: Double? // nil means unlimited
    var validTill: String
    
    // Usage details
    var extraGBUsed: Double
    var extraGBTotal: Double
    
    var bonusDataUsed: Double
    var bonusDataTotal: Double
    
    var payableAmount: Double
}
