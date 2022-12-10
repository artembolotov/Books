//
//  BooksScreen.swift
//  HomeWork 01
//
//  Created by artembolotov on 08.12.2022.
//

import SwiftUI

struct BooksScreen: View {
    
    @EnvironmentObject var modelData: ModelData
    @Binding var navigationPath: [Book]
    @Binding var shouldShowDetail: Bool
    
    var destinationView: some View {
        BookDetail(book: navigationPath.first ?? modelData.books[0])
    }
    
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
                VStack {
                    NavigationLink(destination: destinationView, isActive: $shouldShowDetail) {
                        EmptyView()
                    }
                    List {
                        ForEach(modelData.books) { book in
                            Button {
                                navigationPath = [book]
                                shouldShowDetail = true
                            } label: {
                                BookRow(book: book, simulateArrow: true)
                            }
                        }
                    }
                }
                .modifier(NavigationTitle())
            }
            .navigationViewStyle(.stack)
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
        BooksScreen(navigationPath: .constant([]), shouldShowDetail: .constant(false))
            .environmentObject(ModelData())
    }
}
