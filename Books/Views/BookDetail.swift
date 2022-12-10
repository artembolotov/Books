//
//  BookDetail.swift
//  Books
//
//  Created by artembolotov on 08.12.2022.
//

import SwiftUI

struct BookDetail: View {
    var book: Book
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        List {
            if horizontalSizeClass == .compact {
                Text("compact")
                VStack {
                    bookImage
                    bookHeaderView
                    bookDetailsView
                }
            } else {
                Text("regular")
                HStack {
                    bookImage
                    VStack {
                        bookHeaderView
                        bookDetailsView
                    }
                }
            }
        }
    }
    
    var bookImage: some View {
        Image(book.imageLink)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxHeight: 300)
    }
    
    var bookHeaderView: some View {
        Group {
            Text(book.title)
                .font(.title)
                .multilineTextAlignment(.center)
            Text(book.author)
                .font(.title2)
        }
    }
    
    var bookDetailsView: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Language:")
                    Text(book.language)
                        .foregroundColor(.secondary)
                }
                HStack {
                    Text("Country:")
                    Text(book.country)
                        .foregroundColor(.secondary)
                }
                HStack {
                    Text("Pages:")
                    Text("\(book.pageCount)")
                        .foregroundColor(.secondary)
                }
                HStack {
                    Text("Year:")
                    Text("\(String(book.year))")
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: ModelData().books[0])
    }
}
