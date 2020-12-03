//
//  AlbumInfoRouter.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 03.12.2020.
//

import UIKit

class AlbumInfoRouter {
    
    weak var view: AlbumInfoView!
    
}

extension AlbumInfoRouter {
    
    func close() {
        
        view.dismiss(animated: true, completion: nil)
    }
    
}
