//
//  FeaturedItem.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 09/07/24.
//

import SwiftUI

struct FeaturedItem: View {
    var course: Course = courses[0]
    
    var body: some View {
            VStack(alignment: .leading, spacing: 8.0) {
                Spacer()
                
                Image(course.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26, height: 26)
                    .cornerRadius(20)
                    .padding(9)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
//                    .shadow(color: .black.opacity(0.4), radius: 20, x: 0, y: 10)
                    .strokeStyle(cornerRadius: 20)
                
                
                
                
                Text(course.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .leading, endPoint: .trailing))
                
                Text(course.subtitle.uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                
                Text(course.text)
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
            .strokeStyle()
            .padding(.horizontal, 20)
    }
}

#Preview {
    FeaturedItem()
}
