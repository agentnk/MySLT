import SwiftUI

struct UsageCircleView: View {
    var usedGB: Double
    
    var body: some View {
        ZStack {
            // Background ring
            Circle()
                .stroke(Color.sltMedBlue, lineWidth: 14)
            
            // Progress ring
            Circle()
                .trim(from: 0.0, to: CGFloat(min(usedGB / 100.0, 1.0)))
                .stroke(
                    style: StrokeStyle(lineWidth: 14, lineCap: .round)
                )
                .foregroundColor(Color(red: 0.55, green: 0.45, blue: 0.90))
                .rotationEffect(.degrees(-90))
            
            // Center text
            VStack(spacing: 6) {
                Text("\(String(format: "%.1f", usedGB))GB")
                    .font(.system(size: 42, weight: .bold))
                    .foregroundColor(Color(red: 0.55, green: 0.45, blue: 0.90))
                Text("used")
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.6))
            }
        }
    }
}
