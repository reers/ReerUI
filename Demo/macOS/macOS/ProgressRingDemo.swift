//
//  ProgressRingDemo.swift
//  macOS
//
//  Created by phoenix on 2025/2/14.
//

import SwiftUI
import ReerUI

struct ProgressRingDemo: View {
    @State private var progress: CGFloat = 0.7
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                ProgressRing(progress: $progress)
                    .frame(width: 200, height: 200)
                // 可选：显示具体进度值
                HStack(alignment: .bottom, spacing: 0) {
                    Text("\(Int(progress * 100))")                    // 显示进度数字
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
