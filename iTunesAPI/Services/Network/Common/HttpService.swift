//
//  HttpService.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 02.12.2020.
//

import Alamofire
import SwiftyJSON

class HttpService {
    
    
    
    func request(url: String, completion: @escaping (JSON) -> Void) {
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                completion(JSON(value))
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
