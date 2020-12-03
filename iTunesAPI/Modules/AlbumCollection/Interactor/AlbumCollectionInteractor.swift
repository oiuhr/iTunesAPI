//
//  AlbumCollectionInteractor.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 02.12.2020.
//

import Foundation

class AlbumCollectionInteractor {
    
    let albumService = AlbumService()
    
}

extension AlbumCollectionInteractor {
    
    func getAlbums(search: String, completion: @escaping ([Album]) -> Void) {
        albumService.getAlbums(searchString: search) { value in
            completion(value)
        }
    }
    
}
