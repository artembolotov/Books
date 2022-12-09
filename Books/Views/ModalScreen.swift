//
//  SheetScreen.swift
//  Books
//
//  Created by artembolotov on 08.12.2022.
//

import SwiftUI

struct ModalScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var text = ""
    @State var isFirstResponder = false
    
    var body: some View {
        VStack {
            LegacyTextField(text: $text, isFirstResponder: $isFirstResponder, configuration: { textField in
                textField.borderStyle = .roundedRect
                textField.clearButtonMode = .always
                textField.placeholder = "Added via UIViewRepresentable"
            })
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 70)
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Press to dismiss")
            }
        }
        .onDisappear() {
            isFirstResponder = false
        }
        
        .onAppear() {
            isFirstResponder = true
        }
    }
}

struct SheetScreen_Previews: PreviewProvider {
    static var previews: some View {
        ModalScreen()
    }
}
