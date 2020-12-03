//
//  AlbumCollectionPresenter.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 02.12.2020.
//

import Foundation
import Alamofire

class AlbumCollectionPresenter {
    
    var data: [Album] = []
    
    weak var view: AlbumCollectionView!
    var interactor: AlbumCollectionInteractor!
    var router: AlbumCollectionRouter!
    
}

extension AlbumCollectionPresenter {
    
    func numberOfCells() -> Int {
        return data.count
    }
    
    func tappedCell(indexPath: IndexPath) {
        router.openAlbumInfo(album: data[indexPath.item])
    }
    
    func getData(search: String, completion: @escaping () -> Void) {
        interactor.getAlbums(search: search) { value in
            self.data = value
            completion()
        }
    }
    
}
