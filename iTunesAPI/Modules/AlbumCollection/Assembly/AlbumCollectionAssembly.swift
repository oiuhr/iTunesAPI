//
//  AlbumCollectionAssembly.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 02.12.2020.
//

import UIKit

class AlbumCollectionAssembly {
    
    func AlbumCollectionModule() -> AlbumCollectionView {
        
        let view = AlbumCollectionView()
        let presenter = AlbumCollectionPresenter()
        let interactor = AlbumCollectionInteractor()
        let router = AlbumCollectionRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.view = view
        
        return view
        
    }
    
}
