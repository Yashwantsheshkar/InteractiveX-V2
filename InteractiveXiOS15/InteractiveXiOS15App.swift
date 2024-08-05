//
//  InteractiveXiOS15App.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 30/06/24.
//

import SwiftUI

@main
struct InteractiveXiOS15App: App {
    @StateObject var model = Model()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
