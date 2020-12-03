//
//  AlbumInfoInteractor.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 03.12.2020.
//

import Foundation

class AlbumInfoInteractor {
    
    let albumInfoSerivce = AlbumInfoService()
    
}

extension AlbumInfoInteractor {
    
    func getAlbumInfo(search: String, completion: @escaping (AlbumInfo) -> Void) {
        albumInfoSerivce.getAlbumInfo(searchString: search) { value in
            completion(value)
        }
    }
    
}
