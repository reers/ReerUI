//
//  Sidebar.swift
//  SharedDemo
//
//  Created by phoenix on 2025/2/14.
//

import SwiftUI
import ReerUI

public struct Sidebar: View {
    public init() {}
    
    @State private var showMenu = false
    @State private var progress: CGFloat = 0.65
    
    public var body: some View {
        List {
            Section("Components Demo") {
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
                
                #if os(macOS)
                if #available(macOS 15.0, *) {
                    NavigationLink(destination: IntelligenceLightView().padding()) {
                        LeftLabel(title: "IntelligenceLight", icon: { RoundedRectangle(cornerRadius: 2) })
                    }
                }
                #endif
                
                #if os(iOS)
                NavigationLink(destination: HamburgerMenu(isActive: $showMenu, lineLength: 80, lineHeight: 4).padding()) {
                    LeftLabel(title: "HamburgerMenu", icon: { HamburgerMenu(isActive: $showMenu, lineLength: 20, lineHeight: 2) })
                }
                #endif
            }
            
            Section("UI Showcase") {
                NavigationLink(destination: StunningEffect().padding()) {
                    LeftLabel(title: "StunningEffect", icon: { Circle() })
                }
                
//                if #available(iOS 17.0, macOS 14.0, *) {
//                    NavigationLink(destination: ShaderView(name: "SDF::main")) {
//                        LeftLabel(title: "ShaderView", icon: { Circle() })
//                    }
//                }
                
                #if os(iOS)
                NavigationLink(destination: VariableBlurDemo().padding()) {
                    LeftLabel(title: "VariableBlur", icon: { Image(systemName: "moonphase.waxing.crescent").resizable().aspectRatio(contentMode: .fit) })
                }
                #endif
            }
        }
        .listStyle(SidebarListStyle())
    }
}

