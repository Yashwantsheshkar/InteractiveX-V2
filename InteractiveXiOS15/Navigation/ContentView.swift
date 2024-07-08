//
//  ContentView.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 30/06/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    var body: some View {
        
        
        ZStack(alignment: .bottom) {
            Group {
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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            TabBar( tabItemWidth: 0)
      }
    }
}
#Preview {
    ContentView()
}
