//
//  Copyright © 2020 _take_hito_
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

@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
public struct ShaderView: View {
    let name: String
    public init(name: String) {
        self.name = name
    }
    
    private var start = Date()
    
    public var body: some View {
        TimelineView(.animation) { context in
            Rectangle().colorEffect(shader(seconds: context.date.timeIntervalSince(start)))
        }
    }
    
    private func shader(seconds: TimeInterval) -> Shader {
        let function = ShaderFunction(library: .default, name: name)
        return function(.boundingRect, .float(seconds))
    }
}
