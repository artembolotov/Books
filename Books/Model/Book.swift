//
//  Book.swift
//  Books
//
//  Created by artembolotov on 08.12.2022.
//

import Foundation
import SwiftUI

struct Book: Hashable, Codable, Identifiable {
    let id = UUID().uuidString
    var title: String
    var author: String
    var country: String
    var language: String
    var pageCount: Int
    var year: Int
    var imageLink: String
    
    private enum CodingKeys: String, CodingKey {
        case title, author, country, language, pageCount = "pages", year, imageLink
    }
}
