//
//  ContentView.swift
//  macOS
//
//  Created by phoenix on 2025/2/13.
//

import SwiftUI
import ReerUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            Sidebar()
        } detail: {
            Text("ReerUI")
                .font(.system(size: 80, weight: .medium))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct Sidebar: View {
    @State private var showMenu = false
    
    var body: some View {
        List {
            NavigationLink(destination: Loading().padding()) {
                LeftLabel(title: "Loading", icon: { Loading(gradientColor: .primary, ballColor: .primary) })
            }
        }
        .listStyle(SidebarListStyle())
    }
}

