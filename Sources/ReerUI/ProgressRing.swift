//
//  Copyright © 2020 sudodee
//  Copyright © 2025 reers.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import SwiftUI

/// A circular progress indicator with rotation animation and gradient styling
@available(macOS 12.0, iOS 15.0, *)
public struct ProgressRing: View {
    @State private var degrees: Double = 0
    @Binding private var progress: CGFloat
    
    private let lineWidthRatio: CGFloat
    private let gradientColors: [Color]
    
    public init(
        progress: Binding<CGFloat>,
        gradientColors: [Color] = [.cyan, .blue],
        lineWidthRatio: CGFloat = 0.15
    ) {
        self._progress = progress
        self.gradientColors = gradientColors
        self.lineWidthRatio = lineWidthRatio
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let lineWidth = size * lineWidthRatio
            
            ZStack {
                Circle()
                    .stroke(lineWidth: lineWidth)
                    .foregroundStyle(.gray.opacity(0.3))
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        LinearGradient(
                            colors: gradientColors,
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        style: StrokeStyle(
                            lineWidth: lineWidth,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .rotationEffect(.degrees(degrees))
            }
            .frame(width: size, height: size)
            .position(x: geometry.size.width/2, y: geometry.size.height/2)
        }
    }
}
