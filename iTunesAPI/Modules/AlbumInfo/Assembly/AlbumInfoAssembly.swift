//
//  AlbumInfoAssembly.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 03.12.2020.
//

import Foundation

class AlbumInfoAssembly {
    
    func albumInfoModule(album: Album) -> AlbumInfoView {
        
        let view = AlbumInfoView()
        let presenter = AlbumInfoPresenter(album: album)
        let router = AlbumInfoRouter()
        let interactor = AlbumInfoInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = view
        
        return view
    }
    
}
