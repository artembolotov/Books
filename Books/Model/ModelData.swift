//
//  ModelData.swift
//  Books
//
//  Created by artembolotov on 08.12.2022.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var books: [Book] = load("books.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Could not find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename) from main bundl")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Could not parse \(filename) as \(T.self):\n\(error)")
    }
    
}
