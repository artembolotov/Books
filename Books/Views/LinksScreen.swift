//
//  QuickAccessScreen.swift
//  HomeWork 01
//
//  Created by artembolotov on 08.12.2022.
//

import SwiftUI

struct LinksScreen: View {
    @EnvironmentObject var modelData: ModelData
    
    @Binding var selectedTab: Int
    @Binding var navigationPath: [Book]
    
    var body: some View {
        Button {
            navigationPath = [modelData.books[90]]
            selectedTab = 1
        } label: {
            Text("Go to Books")
        }

    }
}

struct QuickAccessScreen_Previews: PreviewProvider {
    static var previews: some View {
        LinksScreen(selectedTab: .constant(0), navigationPath: .constant([]))
            .environmentObject(ModelData())
    }
}
