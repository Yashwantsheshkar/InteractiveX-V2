//
//  TabBar.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 07/07/24.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab: Tab = .home
    @State var color: Color = .teal
    @State var tabItemWidth : CGFloat
    
    var body: some View {
        
        
        ZStack(alignment: .bottom) {
            
//            if selectedTab == .home {
//                ContentView()
//                    
//            }
//            
//            else if selectedTab == .explore {
//                AccountView()
//            }
            
            Group {
                switch selectedTab {
                case .home:
                    ContentView()
                case .explore:
                    AccountView()
                case .notifications:
                    AccountView()
                case .library:
                    AccountView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            

            HStack {
                buttons
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in:
                            RoundedRectangle(cornerRadius: 34, style: .continuous)
            )
            .background(
                background
            )
//            .strokeStyle(cornerRadius: 34)
//            .frame(maxHeight: .infinity, alignment: .bottom)
//            .ignoresSafeArea()
            
            .overlay(
                overlay
            )
            .strokeStyle(cornerRadius: 34)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            
        }
    }
    
    var overlay: some View{
        HStack {
            if selectedTab == .library {
                Spacer()
            }
            if selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            
            if selectedTab == .explore{
                Spacer()
            }
            
            
            Rectangle()
                .fill(color)
                .frame(width: 28,height: 5)
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
            
            if selectedTab == .notifications{
                Spacer()
            }
            if selectedTab == .home {
                Spacer()
            }
            if selectedTab == .explore{
                Spacer()
                Spacer()
            }
            
        
        }
            .padding(.horizontal, 8)
    }
    
    var background: some View{
        HStack {
            if selectedTab == .library {
                Spacer()
            }
            if selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            
            if selectedTab == .explore{
                Spacer()
            }
            
            
            Circle()
                .fill(color)
                .frame(width: tabItemWidth)
            
            if selectedTab == .notifications{
                Spacer()
            }
            if selectedTab == .home {
                Spacer()
            }
            if selectedTab == .explore{
                Spacer()
                Spacer()
            }
            
        
        }
            .padding(.horizontal, 8)
    }
    
    var buttons: some View{
        ForEach(tabItems) { item in
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                    selectedTab = item.tab
                    color = item.color
                }
                
            } label : {
                VStack {
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.weight(.bold))
                        .frame(width: 44, height: 29)
                    Text(item.text)
                        .font(.caption2)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
            .blendMode(selectedTab == item.tab ? .overlay : .normal)
            .overlay(
                GeometryReader { proxy in
//                            Text("\(proxy.size.width)")

                    
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                    
                }
            )
            .onPreferenceChange(TabPreferenceKey.self) { value in
                tabItemWidth = value
            }
        }
    }
}

#Preview {
    TabBar( tabItemWidth: 0)
}
