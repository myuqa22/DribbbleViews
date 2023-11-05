//
//  BookTrackingView.swift
//  UITestBuild
//
//  Created by Privat on 03.11.23.
//
// Implemented an design from Dribbble
// Link: https://dribbble.com/shots/6038744-Book-Tracking-App-WIP

import SwiftUI

struct BookTrackingMainView: View {
    
    @State var selection: Int = .zero
    
    var body: some View {
        TabView(selection: $selection) {
            BookTabView()
                .tabItem {
                    Image(systemName: "book")
                        .background(.gray)
                }
                .tag(0)
            Text("Bookshelf")
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                        .background(.gray)
                        .tint(.secondary)
                    
                }
                .tag(1)
            Text("Bookmark")
                .tabItem {
                    Image(systemName: "bookmark.fill")
                        .background(.gray)
                        .tint(.secondary)
                    
                }
                .tag(2)
            UserProfileTabView()
                .tabItem {
                    Image(systemName: "person.fill")
                        .background(.gray)
                        .tint(.secondary)
                    
                }
                .tag(2)
        }
        .tint(.bookOrangeForeground)
    }
}

#Preview {
    BookTrackingMainView()
}
