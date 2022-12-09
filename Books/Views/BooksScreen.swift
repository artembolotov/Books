//
//  BooksScreen.swift
//  HomeWork 01
//
//  Created by artembolotov on 08.12.2022.
//

import SwiftUI

struct BooksScreen: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var navigationPath: [Book] = []
    
    var body: some View {
        if #available(iOS 16, *) {
            NavigationStack(path: $navigationPath) {
                List(modelData.books) { book in
                    NavigationLink(value: book) {
                        BookRow(book: book)
                    }
                }
                .navigationDestination(for: Book.self) { book in
                    BookDetail(book: book)
                }
                .modifier(NavigationTitle())
            }
        } else {
            NavigationView {
                List(modelData.books) { book in
                    NavigationLink {
                        BookDetail(book: book)
                    } label: {
                        BookRow(book: book)
                    }
                }
                .modifier(NavigationTitle())
            }
        }
    }
    
    struct NavigationTitle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .navigationTitle("Books")
        }
    }
}

struct BooksScreen_Previews: PreviewProvider {
    static var previews: some View {
        BooksScreen()
            .environmentObject(ModelData())
    }
}
