import SwiftUI

/// A rotating loading indicator with customizable colors
public struct Loading: View {
    @State private var rotationDegrees: Double = 0
    private let animationDuration: Double = 2
    private let gradientColor: Color
    private let ballColor: Color
    private let minCircleInset: CGFloat = 3
    
    /// Creates a loading indicator with customizable colors
    /// - Parameters:
    ///   - gradientColor: Color for the gradient effect (default: accentColor)
    ///   - ballColor: Color for the indicator ball (default: accentColor)
    public init(gradientColor: Color = .accentColor, ballColor: Color = .accentColor) {
        self.gradientColor = gradientColor
        self.ballColor = ballColor
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let minSide = min(geometry.size.width, geometry.size.height)
            let gradientSize = CGSize(width: minSide, height: minSide)
            let circleWidth = minSide / 3
            
            ZStack {
                // Configurable gradient background
                AngularGradient(
                    gradient: Gradient(colors: [
                        gradientColor.opacity(0),
                        gradientColor
                    ]),
                    center: .center,
                    startAngle: .degrees(0),
                    endAngle: .degrees(360)
                )
                .frame(width: gradientSize.width, height: gradientSize.height)
                .mask(gradientMask(minSide: minSide))
                
                // Configurable indicator circle
                Circle()
                    .fill(ballColor)
                    .frame(width: circleWidth, height: circleWidth)
                    .offset(x: minSide/2 - circleWidth/2)
            }
            .rotationEffect(.degrees(rotationDegrees))
            .onAppear(perform: startRotation)
        }
    }
    
    /// Creates the ring-shaped mask for the gradient
    private func gradientMask(minSide: CGFloat) -> some View {
        ZStack {
            Circle()
                .frame(width: minSide, height: minSide)
            
            Circle()
                .frame(
                    width: minSide - minSide/1.5,
                    height: minSide - minSide/1.5
                )
                .blendMode(.destinationOut)
        }
        .compositingGroup()
    }
    
    /// Starts the infinite rotation animation
    private func startRotation() {
        withAnimation(
            Animation.linear(duration: animationDuration)
            .repeatForever(autoreverses: false)
        ) {
            rotationDegrees = 360
        }
    }
}

// MARK: - Preview
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
            .frame(width: 100, height: 100)
            .background(Color.black)
    }
}
