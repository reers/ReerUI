//
//  ContentView.swift
//  macOS
//
//  Created by phoenix on 2025/2/13.
//

import SwiftUI
import ReerUI
import ReerKit

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
    @State private var progress: CGFloat = 0.65
    
    var body: some View {
        List {
            NavigationLink(destination: Loading().padding()) {
                LeftLabel(title: "Loading", icon: { Loading(gradientColor: .primary, ballColor: .primary) })
            }
            NavigationLink(destination: ProgressRingDemo()) {
                LeftLabel(title: "ProgressRing", icon: {
                    ProgressRing(progress: $progress, gradientColors: [.cyan, .blue], lineWidthRatio: 0.3)
                        .frame(width: 15, height: 15)
                })
            }
            NavigationLink(destination: GradientProgressRingDemo()) {
                LeftLabel(title: "GradientProgressRing", icon: {
                    GradientProgressRing(
                        angleLength: 240,
                        rotateAngle: 150,
                        progress: $progress,
                        strokeWidth: 4,
                        bgColor: Color(.lightGray.withAlphaComponent(0.5)),
                        gradientStops: [
                            .init(color: Color(.re(hex: 0xFF86AA)), location: 0.17),
                            .init(color: Color(.re(hex: 0xFF4B75)), location: 0.34),
                            .init(color: Color(.re(hex: 0xEF3CFF)), location: 0.5),
                            .init(color: Color(.re(hex: 0x7E5EFF)), location: 0.66),
                            .init(color: Color(.re(hex: 0x8064FF)), location: 0.83),
                        ]
                    )
                })
            }
            NavigationLink(destination: StunningEffect().padding()) {
                LeftLabel(title: "StunningEffect", icon: { Image(systemName: "tennisball.fill").resizable() })
            }
        }
        .listStyle(SidebarListStyle())
    }
}

