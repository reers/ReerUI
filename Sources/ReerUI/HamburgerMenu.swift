//
//  HamburgerMenu.swift
//  ReerUI
//
//  Created by phoenix on 2025/2/13.
//

import SwiftUI

/// A customizable hamburger menu button that animates between hamburger and close states
@available(iOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct HamburgerMenu: View {
    // MARK: - Properties
    
    /// Binding to control the active state of the menu
    @Binding private var isActive: Bool
    
    /// The length of each line in the hamburger menu
    private let lineLength: CGFloat
    
    /// The height/thickness of each line
    private let lineHeight: CGFloat
    
    // MARK: - Initialization
    
    /// Creates a new hamburger menu with customizable dimensions
    /// - Parameters:
    ///   - isActive: Binding to control the menu state
    ///   - lineLength: The length of each line (default: 40)
    ///   - lineHeight: The height/thickness of each line (default: 4)
    public init(isActive: Binding<Bool>, lineLength: CGFloat = 40, lineHeight: CGFloat = 4) {
        self._isActive = isActive
        self.lineLength = lineLength
        self.lineHeight = lineHeight
    }
    
    // MARK: - Body
    
    public var body: some View {
        Button(action: toggleMenu) {
            VStack(spacing: calculateSpacing()) {
                topLine
                middleLine
                bottomLine
            }
        }
    }
    
    // MARK: - Private Methods
    
    /// Toggles the menu state with animation
    private func toggleMenu() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
            isActive.toggle()
        }
    }
    
    /// Top line of the hamburger menu
    /// Rotates -45 degrees when active
    private var topLine: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: lineLength, height: lineHeight)
            .rotationEffect(.degrees(isActive ? -45 : 0), anchor: .trailing)
            .offset(x: isActive ? -lineLength * (1 - 0.707) / 2 : 0)
    }
    
    /// Middle line of the hamburger menu
    /// Fades out when active
    private var middleLine: some View {
        Group {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: isActive ? 0 : lineLength, height: lineHeight)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .opacity(isActive ? 0 : 1)
        .frame(width: lineLength)
    }
    
    /// Bottom line of the hamburger menu
    /// Rotates 45 degrees when active
    private var bottomLine: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: lineLength, height: lineHeight)
            .rotationEffect(.degrees(isActive ? 45 : 0), anchor: .trailing)
            .offset(x: isActive ? -lineLength * (1 - 0.707) / 2 : 0)
    }
    
    /// Calculates the optimal spacing between lines for smooth animation
    /// - Returns: The calculated spacing value
    private func calculateSpacing() -> CGFloat {
        (lineLength * 1.414 * 0.5 - lineHeight * 2) / 2
    }
}

// MARK: - Preview Provider

#if DEBUG && os(iOS)
struct HamburgerMenu_Previews: PreviewProvider {
    static var previews: some View {
        HamburgerMenu(isActive: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
#endif
