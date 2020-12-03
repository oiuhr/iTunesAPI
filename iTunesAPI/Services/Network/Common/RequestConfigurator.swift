//
//  RequestConfigurator.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 02.12.2020.
//

struct RequestConfigurator {
    
    static let baseUrl: String = "https://itunes.apple.com/"
    
    struct Entry {
        static let search: String = "search?"
        static let lookup: String = "lookup?"
    }
    
    struct Fields {
        static let id: String = "id"
        static let kind: String = "king"
        static let term: String = "term"
        static let entity: String = "entity"
        static let attribute: String = "attribute"
    }
    
    struct Parameters {
        static let song: String = "song"
        static let album: String = "album"
        static let albumTerm: String = "albumTerm"
    }
    
}
