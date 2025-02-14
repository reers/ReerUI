//
//  macOSApp.swift
//  macOS
//
//  Created by phoenix on 2025/2/13.
//

import SwiftUI
import SharedDemo

@main
@available(macOS 16.0, *)
struct macOSApp: App {
    var body: some Scene {
        WindowGroup {
            SharedDemoView()
                .frame(minWidth: 780, minHeight: 600)
        }
        .windowStyle(.hiddenTitleBar)
    }
}
