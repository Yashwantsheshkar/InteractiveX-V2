//
//  PreferenceKeys.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 09/07/24.
//

import SwiftUI

struct ScrollPrefereceKye: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
