// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(macOS 16.0, *)
public struct SharedDemoView: View {
    public init() {}
    
    public var body: some View {
        NavigationSplitView {
            Sidebar()
        } detail: {
            Text("ReerUI")
                .font(.system(size: 80, weight: .medium))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
