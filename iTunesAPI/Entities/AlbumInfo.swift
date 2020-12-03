//
//  AlbumInfo.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 03.12.2020.
//

import Foundation

struct AlbumInfo {
    
    var releaseDate: String
    var primaryGenreName: String
    var trackList: [Song]
}

struct Song {
    
    var trackName: String
    var trackImage: String
}
