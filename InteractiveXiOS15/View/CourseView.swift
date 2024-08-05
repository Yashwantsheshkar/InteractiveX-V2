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
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            
            Button{
                withAnimation( .spring(response: 0.6, dampingFraction: 0.8)){
                    show.toggle()
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
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(.black)
        .background(Image(course.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .matchedGeometryEffect(id: "image\(course.id)", in: namespace))
        .background(Image(course.background)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .matchedGeometryEffect(id: "background\(course.id)", in: namespace))
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
        )
        .overlay(
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
        )
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View{
        CourseItem(namespace: namespace, show: .constant(true))
    }
}
