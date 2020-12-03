//
//  AlbumService.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 02.12.2020.
//

import Foundation
import SwiftyJSON

class AlbumService: HttpService {
    
    func getAlbums(searchString: String, completion: @escaping ([Album]) -> Void) {
        
        guard let url = RequestConfigurator().url(searchString: searchString).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return }

        request(url: url) { value in
            var data: [Album] = []
            
            for album in value["results"].arrayValue {
                
                //replacing occerencies for bigger image res
                
                data.append(Album(artistName: album["artistName"].stringValue, collectionName: album["collectionName"].stringValue, collectionImage: album["artworkUrl100"].stringValue.replacingOccurrences(of: "100x100bb", with: "200x200bb"), collectionId: album["collectionId"].stringValue))
            }
            
            let sortedData = data.sorted { (first, second) -> Bool in
                let firstName = first.collectionName
                let secondName = second.collectionName
                return (firstName.localizedCaseInsensitiveCompare(secondName) == .orderedAscending)
            }
            
            completion(sortedData)
        }
        
    }
    
}

fileprivate extension RequestConfigurator {
    
    func url(searchString: String) -> String {
        
        let endpoint = "\(RequestConfigurator.Entry.search)\(RequestConfigurator.Fields.entity)=\(RequestConfigurator.Parameters.album)&\(RequestConfigurator.Fields.term)=\(searchString)"
        let url = RequestConfigurator.baseUrl + endpoint
        
        return url
    }
    
}
