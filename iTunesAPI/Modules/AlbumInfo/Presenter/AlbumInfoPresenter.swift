//
//  AlbumInfoPresenter.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 03.12.2020.
//

import Foundation

class AlbumInfoPresenter {
    
    weak var view: AlbumInfoView!
    var router: AlbumInfoRouter!
    var presenter: AlbumInfoPresenter!
    var interactor: AlbumInfoInteractor!
    
    let initialAlbumData: Album
    var albumData = AlbumInfo(releaseDate: "", primaryGenreName: "", trackList: [])
    
    init(album: Album) {
        self.initialAlbumData = album
    }
    
}

extension AlbumInfoPresenter {
    
    func getData(search: String, completion: @escaping () -> Void) {

        interactor.getAlbumInfo(search: search) { value in
            self.albumData = value
            completion()
        }
    }
    
    func closeButtonTapped() {
        
        router.close()
    }
    
}
