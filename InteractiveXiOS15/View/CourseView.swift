//
//  CourseView.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 29/07/24.
//

import SwiftUI

struct CourseView: View {
    
    var namespace: Namespace.ID
    var course: Course = courses[0]
    @Binding var show: Bool
    @State var appear = [false, false, false]
    @EnvironmentObject var model: Model
    @State var viewState: CGSize = .zero
    @State var isDraggable = true
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
            }
            .coordinateSpace(name: "scroll")
            .onAppear { model.showDetail = true }
            .onDisappear { model.showDetail = false}
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: viewState.width / 3, style: .continuous))
            .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 10)
            .scaleEffect(viewState.width / -500 + 1)
            .background(.black.opacity(viewState.width / 500))
            .background(.ultraThinMaterial)
            .gesture(isDraggable ? drag : nil)
            .ignoresSafeArea()
            
            Button{
                withAnimation( .spring(response: 0.6, dampingFraction: 0.8)){
                    show.toggle()
                    model.showDetail.toggle()
               }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundStyle(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            
            .ignoresSafeArea()
        }

        .onAppear{
            
//            chaininig of the animations
            
            withAnimation(.easeOut.delay(0.3)){
                appear[0] = true
            }
          
            withAnimation(.easeOut.delay(0.4)){
                appear[1] = true
            }
            
            withAnimation(.easeOut.delay(0.5)){
                appear[2] = true
            }
        }
        
        .onChange(of: show) { newValue in
            appear[0] = false
            appear[1] = false
            appear[2] = false
            
        }
     
    }
    var cover: some View{
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .foregroundStyle(.black)
            
            .background(
                Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(course.id)", in: namespace))
            .offset(y: scrollY > 0 ? scrollY * -0.8 : 0)
                
            
            .background(Image(course.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background\(course.id)", in: namespace))
            .offset(y: scrollY > 0 ? -scrollY : 0)
            .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                .blur(radius: scrollY / 10)
            
            .mask(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
            .overlay(
                overlayContent
                    .offset(y: scrollY > 0 ? scrollY * -0.6 : 0)
            )
        }
        .frame(height: 500)
    }
    var overlayContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(course.text)
                .font(.footnote)
            .matchedGeometryEffect(id: "text\(course.id)", in: namespace)
            Text(course.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
            Text(course.title)
                .font(.largeTitle.weight(.bold))
                .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .opacity(appear[0] ? 1 : 0)
            HStack{
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
                Text("By Yashwant Sheshkar")
                    .font(.footnote)
                    .fontWeight(.bold)
            }
            .opacity(appear[1] ? 1 : 0)
            
        }
    .padding(20)
    .background(
        Rectangle()
            .fill(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 35, style: .continuous ))
            .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
    )
    .offset(y: 250)
    .padding(20)
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                guard value.translation.width > 0 else {return}
                
                if value.startLocation.x < 100 {
                    withAnimation(.easeInOut) {
                        viewState = value.translation
                    }
                    
                }
                
                if viewState.width > 120{
                    close()
                }
                
            }
            .onEnded { value in
                if viewState.width > 80 {
                    close()
                } else {
                    withAnimation(.easeInOut) {
                        viewState = .zero
                    }
                }
               
                
            }
    }
    
    func close() {
        
            withAnimation (.easeInOut.delay(0.3)) {
                show.toggle()
                model.showDetail.toggle()
            }
        
        withAnimation(.easeInOut) {
            viewState = .zero
        }
        
        isDraggable = false
    
    }
}


struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View{
        CourseItem(namespace: namespace, show: .constant(true))
            .environmentObject(Model())
    }
}
