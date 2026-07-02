import SwiftUI

struct UsageCircleView: View {
    var usedGB: Double
    
    var body: some View {
        ZStack {
            // Background Circle
            Circle()
                .stroke(lineWidth: 15)
                .opacity(0.1)
                .foregroundColor(.white)
            
            // Progress Circle (mocked progress for unlimited)
            Circle()
                .trim(from: 0.0, to: 0.3) // Representing some usage
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: 270.0))
            
            // Text in the middle
            VStack(spacing: 8) {
                Text("\(String(format: "%.1f", usedGB))GB")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
                
                Text("used")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
        }
    }
}
