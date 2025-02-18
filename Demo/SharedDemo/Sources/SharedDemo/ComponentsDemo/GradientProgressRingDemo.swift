//
//  GradientProgressRingDemo.swift
//  macOS
//
//  Created by phoenix on 2025/2/14.
//

import SwiftUI
import ReerUI
import ReerKit

public struct GradientProgressRingDemo: View {
    public init() {}
    
    @State private var progress: CGFloat = 0.7
    
    public var body: some View {
        
        VStack(spacing: 20) {
            ZStack {
                GradientProgressRing(
                    angleLength: 240,
                    rotateAngle: 150,
                    progress: $progress,
                    strokeWidth: 40,
                    bgColor: Color(.lightGray.withAlphaComponent(0.5)),
                    gradientStops: [
                        .init(color: Color(.re(hex: 0xFF86AA)), location: 0.17),
                        .init(color: Color(.re(hex: 0xFF4B75)), location: 0.34),
                        .init(color: Color(.re(hex: 0xEF3CFF)), location: 0.5),
                        .init(color: Color(.re(hex: 0x7E5EFF)), location: 0.66),
                        .init(color: Color(.re(hex: 0x8064FF)), location: 0.83),
                    ]
                )
                
                // 可选：显示具体进度值
                HStack(alignment: .bottom, spacing: 0) {
                    Text("\(Int(progress * 100))")
                        .font(.system(size: 50))
                    Text("%")
                        .padding(.bottom, 5)
                        .font(.system(size: 20, weight: .bold))
                }
            }
            .padding(.vertical)
            
            // 添加滑块
            Slider(value: $progress, in: 0...1) {
                Text("Progress")
            } minimumValueLabel: {
                Text("0%")
            } maximumValueLabel: {
                Text("100%")
            }
            .padding(.horizontal)
            
        }
        .padding()
    }
}
