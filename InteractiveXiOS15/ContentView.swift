//
//  ContentView.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 30/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            
            Image("Logo 2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 26, height: 26)
                .cornerRadius(20)
                .padding(9)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: .black.opacity(0.4), radius: 20, x: 0, y: 10)
                .strokeStyle(cornerRadius: 20)
            
            
            
            
            Text("SwiftUI for iOS 15")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .leading, endPoint: .trailing))
            
            Text("20 sections - 3 hours".uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            
            Text("Buil an iOS app for iOS 15 with custom layouts, animations and ...")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.secondary)
                
            
            
            
        }
        .padding(.all, 20)
        .padding(.vertical, 20)
        .frame(height: 350)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0.0, y: 10)
        .strokeStyle()

        .padding(.horizontal, 20)
        .background(
            Image("Blob 1")
            .offset(CGSize(width: 250, height: -100))
        )
        .overlay(
            Image("Illustration 5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(CGSize(width: 32.0, height: -80.0))
        )
                
        
        
        
    }
}

#Preview {
    ContentView()
}
