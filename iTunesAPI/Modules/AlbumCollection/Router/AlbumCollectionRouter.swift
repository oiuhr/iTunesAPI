//
//  AlbumCollectionRouter.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 03.12.2020.
//

import UIKit

class AlbumCollectionRouter {
    
    weak var view: AlbumCollectionView!
    
}

extension AlbumCollectionRouter {
    
    func openAlbumInfo(album: Album) {
        
        let module = AlbumInfoAssembly().albumInfoModule(album: album)
        
        let vc = UINavigationController(rootViewController: module)
        
        vc.modalPresentationStyle = .fullScreen
        vc.isModalInPresentation = true

        view.present(vc, animated: true, completion: nil)
        
    }
    
}
