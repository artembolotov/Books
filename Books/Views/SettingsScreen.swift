//
//  SettingsScreen.swift
//  HomeWork 01
//
//  Created by artembolotov on 08.12.2022.
//

import SwiftUI

struct SettingsScreen: View {
    @State private var showingModal = false
    
    var body: some View {
        Button {
            showingModal = true
        } label: {
            Text("Show modal screen")
        }
        .sheet(isPresented: $showingModal) {
            ModalScreen()
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
