//
//  HomeView.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 08/07/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var hasScrolled = false
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            ScrollView {
                
                scrollDetection
                
                featured
                
                Color.clear.frame(height: 1000)
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ScrollPrefereceKye.self, perform: { value in
                
                withAnimation(.easeInOut) {
                    if value < 0{
                        hasScrolled = true
                    }
                    else{
                        hasScrolled = false
                    }
                }
                
            })
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
                    
        )
        }
    }
    
    var scrollDetection: some View {
        GeometryReader{ proxy in
//                Text("\(proxy.frame(in: .named("scroll")).minY)")
            Color.clear.preference(key: ScrollPrefereceKye.self, value: proxy.frame(in: .named("scroll")).minY)
            
        }
        .frame(height: 0)
    }
    
    var featured: some View {
        TabView {
            ForEach(courses) { course in
                GeometryReader { proxy in
                    
                    let minX = proxy.frame(in: .global).minX
                    
                    FeaturedItem(course: course)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0.0, y: 10)
                        .blur(radius: abs(minX) / 40)
                    
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(CGSize(width: 32.0, height: -80.0))
                                .offset(x: minX / 2)
                                
                    )
                    
//                    Text("\(proxy.frame(in: .global).minX)")

                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        
        .background(
            Image("Blob 1")
            .offset(CGSize(width: 250, height: -100))
        )
    }
}

#Preview {
    HomeView()
}
