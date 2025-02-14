//
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

/// 环形渐变进度条
public struct GradientProgressRing: View {
    /// 进度百分比
    @Binding private var progress: CGFloat
    /// 角度区间, 表示需要展示的圆弧范围
    let angleLength: Double
    /// 顺时针旋转角度, 正常圆弧的起点(0度)是从正右侧开始
    let rotateAngle: Double
    /// 线条宽度
    let strokeWidth: CGFloat
    /// 背景线条颜色
    let bgColor: Color
    /// 渐变颜色
    let gradientStops: [Gradient.Stop]
    
    public init(
        angleLength: Double,
        rotateAngle: Double,
        progress: Binding<CGFloat>,
        strokeWidth: CGFloat = 30,
        bgColor: Color = .gray,
        gradientStops: [Gradient.Stop]
    ) {
        self.angleLength = angleLength
        self.rotateAngle = rotateAngle
        self._progress = progress
        self.strokeWidth = strokeWidth
        self.bgColor = bgColor
        self.gradientStops = gradientStops
        
        self.endAngle = Angle(degrees: angleLength)
    }
    
    @State private var startAngle = Angle(degrees: 0)
    @State private var endAngle: Angle
    
    public var body: some View {
        ZStack {
            Circle()
                .trim(from: startAngle.degrees / 360.0, to: endAngle.degrees / 360.0)
                .stroke(
                    bgColor,
                    style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round)
                )
                .padding(strokeWidth / 2)
            
            Circle()
                .trim(from: startAngle.degrees / 360.0, to: angleLength * progress / 360.0)
                .stroke(
                    AngularGradient(
                        stops: gradientStops,
                        center: .center,
                        startAngle: startAngle,
                        endAngle: endAngle
                    ),
                    style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round)
                )
                .padding(strokeWidth / 2)
                .animation(Animation.easeInOut(duration: 0.2), value: progress)
        }
        .rotationEffect(.init(degrees: rotateAngle))
    }
}
