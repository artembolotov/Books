//
//  ContentView.swift
//  HomeWork 01
//
//  Created by artembolotov on 06.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    @State private var navigationPath: [Book] = []
    @State private var shouldShowDetail = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LinksScreen(selectedTab: $selectedTab, navigationPath: $navigationPath, shouldShowDetail: $shouldShowDetail)
                .tabItem {
                    Label("Links", systemImage: "arrow.up.right")
                }
                .tag(0)
            BooksScreen(navigationPath: $navigationPath, shouldShowDetail: $shouldShowDetail)
                .tabItem {
                    Label("Books", systemImage: "books.vertical")
                }
                .tag(1)
            SettingsScreen()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
