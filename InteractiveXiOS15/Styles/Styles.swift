//
//  Styles.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 01/07/24.
//

import SwiftUI

struct StrokeStyle : ViewModifier {
    var cornerRadius : CGFloat
    
    @Environment(\.colorScheme) var colorScheme
    
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(colorScheme == .dark ? 0.6: 0.3) , .black.opacity(0.1)], startPoint: .top, endPoint: .bottom))
                .blendMode(.overlay)
        )
    }
}


extension View {
    func strokeStyle(cornerRadius: CGFloat = 30) -> some View{
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}
