//
//  VariableBlurDemo.swift
//  SharedDemo
//
//  Created by phoenix on 2025/2/14.
//

#if canImport(UIKit)
import SwiftUI
import ReerUI

public struct VariableBlurDemo: View {
    public init() {}
    public var body: some View {
        ZStack(alignment: .top) {
            Color.white
            Color.blue.opacity(0.3)
            Image(systemName: "calendar.badge.plus")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 50)
            Text("VariableBlur")
                .font(.largeTitle.monospaced().weight(.bold))
                .padding(.top, 230)
                .foregroundStyle(.white.opacity(0.9))
        }
        .overlay(alignment: .top) {
            VariableBlurView(maxBlurRadius: 20, direction: .blurredTopClearBottom)
                .frame(height: 200)
        }
        .ignoresSafeArea()
    }
}
#endif
