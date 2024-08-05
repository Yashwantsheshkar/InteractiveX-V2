//
//  ContentView.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 30/06/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @EnvironmentObject var model: Model
    
    var body: some View {
        
        
        ZStack(alignment: .bottom) {
            
                switch selectedTab {
                case .home:
                    HomeView()
                case .explore:
                    AccountView()
                case .notifications:
                    AccountView()
                case .library:
                    AccountView()
                }
            
            TabBar(tabItemWidth: 0)
                .offset(y: model.showDetail ? 200 : 0)
            
      }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(Model())
}
