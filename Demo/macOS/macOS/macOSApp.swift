//
//  macOSApp.swift
//  macOS
//
//  Created by phoenix on 2025/2/13.
//

import SwiftUI

@main
struct macOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 780, minHeight: 600)
        }
        .windowStyle(.hiddenTitleBar)
    }
}
