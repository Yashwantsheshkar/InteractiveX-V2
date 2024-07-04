//
//  AccountView.swift
//  InteractiveXiOS15
//
//  Created by Yashwant Sheshkar on 04/07/24.
//

import SwiftUI

struct AccountView: View {
    
    @State var isDeleted = false
    
    var body: some View {
        NavigationStack {
            List {
                profile
                menu
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    //MARK: - PROFILE
    
    var profile: some View{
        VStack(spacing: 8.0) {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.5))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    Image(systemName: "hexagon")
                        .symbolVariant(.fill)
                        .foregroundStyle(.blue)
                        .font(.system(size: 200))
                        .offset(x: -55, y: -100)
                        
            )
            Text("Yashwant S.")
                .font(.title.weight(.bold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                Text("India")
                    .foregroundStyle(.secondary)
            }
            
        }
        
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    
    //MARK: - MENU
    
    
    var menu: some View{
        
        //              instead of using HStack for showing the gear and image together will use the label instead of text along with the image name
        
        
        Section {
            NavigationLink { ContentView() } label:  {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink { ContentView() } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink { ContentView() } label: {
                Label("Help" , systemImage: "questionmark")
            }
        }
        .foregroundColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
        
    }
    
    
    //MARK: - LINKS
    
    var links: some View {
        
        Section {
            if isDeleted == false {
                Link(destination: URL(string: "https://yashwantsheshkar7.artstation.com")!) {
                    HStack {
                        Label("ArtStation", systemImage: "move.3d")
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "link")
                            .tint(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true){
                    
                    Button(action: { isDeleted = true }, label: {
                        Label("Delete", systemImage: "trash")
                    })
                    .tint(.red)
                    
                    Button {} label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.yellow)
            }
            }
            
            
            
            Link(destination: URL(string: "https://www.youtube.com/channel/UCBPTXtx6-azxFJ5XSJiVczQ")!) {
                HStack {
                    Label("YouTube", systemImage: "tv")
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "link")
                        .tint(.secondary)
                }
            }
            
        }
        
    }
    
    
}

#Preview {
    AccountView()
}


