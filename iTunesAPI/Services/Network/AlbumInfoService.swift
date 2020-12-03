//
//  AlbumInfoService.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 03.12.2020.
//

import Foundation
import SwiftyJSON

class AlbumInfoService: HttpService {
    
    func getAlbumInfo(searchString: String, completion: @escaping (AlbumInfo) -> Void) {
        
        guard let url = RequestConfigurator().url(searchString: searchString).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return }

        request(url: url) { value in
            
            let primaryGenreName = value["results"].arrayValue[0]["primaryGenreName"].stringValue
            var releaseDate = value["results"].arrayValue[0]["releaseDate"].stringValue
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            if let date = dateFormatter.date(from: releaseDate) {
                dateFormatter.dateFormat = "MMM dd,yyyy"
                releaseDate = dateFormatter.string(from: date)
            }

            var data = AlbumInfo(releaseDate: releaseDate,
                                 primaryGenreName: primaryGenreName,
                                 trackList: [])

            
            for track in value["results"].arrayValue {
                if track["wrapperType"].stringValue != "collection" {
                    
                    //replacing occerencies for bigger image res
                    
                    data.trackList.append(Song(trackName: track["trackName"].stringValue.replacingOccurrences(of: "100x100bb", with: "200x200bb"),
                                               trackImage: track["artworkUrl30"].stringValue
                    ))
                }
            }
            completion(data)
        }
        
    }
    
}

fileprivate extension RequestConfigurator {
    
    func url(searchString: String) -> String {
        
        let endpoint = "\(RequestConfigurator.Entry.lookup)\(RequestConfigurator.Fields.id)=\(searchString)&\(RequestConfigurator.Fields.entity)=\(RequestConfigurator.Parameters.song)"
        let url = RequestConfigurator.baseUrl + endpoint
        
        return url
    }
    
}
