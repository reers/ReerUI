//
//  Copyright © 2020 AlbertMoral
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

public struct StunningEffect: View {
    public init() {}
    
    @State private var position: CGPoint = .zero
    
    public var body: some View {
        GeometryReader { proxy in
            let proxyWidth = proxy.size.width * 0.5
            let proxyHeight = proxy.size.height * 0.5
            
            Canvas { context, size in
                context.addFilter(.alphaThreshold(min: 0.8, color: .red))
                context.addFilter(.blur(radius: 22))
                context.drawLayer { ctx in
                    ctx.fill(
                        Circle()
                            .path(in: .init(
                                x: proxyWidth + position.x - 50,
                                y: proxyWidth + position.y - 200,
                                width: 120,
                                height: 120
                            )),
                        with: .foreground
                    )
                    
                    ctx.fill(
                        Circle()
                            .path(in: .init(
                                x: proxyWidth - 150,
                                y: proxyHeight - 300,
                                width: 300,
                                height: 300
                            )),
                        with: .foreground
                    )
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        position = .init(x: gesture.translation.width, y: gesture.translation.height)
                    }
            )
        }
    }
}
