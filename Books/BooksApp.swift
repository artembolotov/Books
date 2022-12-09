//
//  HomeWork_01App.swift
//  HomeWork 01
//
//  Created by artembolotov on 06.12.2022.
//

import SwiftUI

@main
struct HomeWork_01App: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
