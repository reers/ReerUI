//
//  ProgressCircle.swift
//  ReerUI
//
//  Created by phoenix on 2025/2/13.
//

import SwiftUI

/// A circular progress indicator with rotation animation and gradient styling
@available(macOS 12.0, *)
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
