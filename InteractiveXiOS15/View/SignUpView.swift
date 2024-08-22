//
//  SignUpView.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 14/08/24.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text("Sign up")
                .font(.largeTitle).bold()
            Text("Access 120+ hours of courses, tutorials and livestreams")
                .font(.headline)
            Button {} label: {
                Text("Create and account")
            }
            .buttonStyle(.borderedProminent)
        }
        
            
    }
}

#Preview {
    SignUpView()
}
