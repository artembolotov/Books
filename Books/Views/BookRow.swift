//
//  BookRow.swift
//  Books
//
//  Created by artembolotov on 08.12.2022.
//

import SwiftUI

struct BookRow: View {
    var book: Book
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                Text(book.author)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: ModelData().books[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
