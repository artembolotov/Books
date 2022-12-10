//
//  BookRow.swift
//  Books
//
//  Created by artembolotov on 08.12.2022.
//

import SwiftUI

struct BookRow: View {
    var book: Book
    var simulateArrow: Bool = false
    
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
            if simulateArrow {       
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(UIColor.tertiaryLabel))
                    .font(Font.system(.footnote).weight(.semibold))
            }
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: ModelData().books[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
