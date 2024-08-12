//
//  Suggestion.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 13/08/24.
//

import SwiftUI

struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
    
}

var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "React"),
    Suggestion(text: "Design")
    
]
