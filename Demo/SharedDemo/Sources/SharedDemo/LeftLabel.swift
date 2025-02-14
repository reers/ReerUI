//
//  LeftLabel.swift
//  macOS
//
//  Created by phoenix on 2025/2/13.
//

import SwiftUI

public struct LeftLabel<Icon: View>: View {
    let title: String
    @ViewBuilder var icon: () -> Icon
    
    public init(title: String, icon: @escaping () -> Icon) {
        self.title = title
        self.icon = icon
    }
    
    public var body: some View {
        Label(
            title: {
                Text(title)
                    .font(.system(size: 16))
                    .padding(.leading)
            },
            icon: { icon() }
        )
    }
}
