//
//  ContentView.swift
//  iOS
//
//  Created by phoenix on 2025/2/13.
//

import SwiftUI
import ReerUI

struct ContentView: View {
    @State private var showMenu = false
    var body: some View {
        HamburgerMenu(isActive: $showMenu, lineLength: 80, lineHeight: 4)
    }
}

#Preview {
    ContentView()
}
