//
//  HomeView.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 08/07/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = true
    @State var selectedID = UUID()
    
    var body: some View {


        ZStack {
            Color("Background")
                .ignoresSafeArea()
            ScrollView {
                
                scrollDetection
                
                featured

                Text("Courses".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)

                if !show{
                    ForEach(courses) { course in
                        CourseItem(namespace: namespace, course: course, show: $show)
                            .onTapGesture(){
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                    show.toggle()
                                    showStatusBar = false
                                    selectedID = course.id
                                }
                        }
                    }
                }else {
                    ForEach(courses) { course in
                        Rectangle()
                            .fill(.white)
                            .frame(height: 300)
                            .cornerRadius(30)
                            .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                            .opacity(0.3)
                        .padding(.horizontal, 30)
                    }
                }
                
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
                    
        )
            if show{
                ForEach(courses) { course in
                    if course.id == selectedID{
                        CourseView(namespace: namespace,course: course, show: $show)
                            .zIndex(1.0)
                        .transition(.asymmetric(insertion: .opacity.animation(.easeInOut(duration: 0.1)), removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))))
                    }
                    
                }
            }
            
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation {
                if newValue {
                    showStatusBar = false
                }else {
                    showStatusBar = true
                }
            }
            
        }    }
    
    var scrollDetection: some View {
        GeometryReader{ proxy in
//                Text("\(proxy.frame(in: .named("scroll")).minY)")
            Color.clear.preference(key: ScrollPrefereceKye.self, value: proxy.frame(in: .named("scroll")).minY)
            
        }
        .frame(height: 0)
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
    }
    
    var featured: some View {
        TabView {
            ForEach(featuredCourses) { course in
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
