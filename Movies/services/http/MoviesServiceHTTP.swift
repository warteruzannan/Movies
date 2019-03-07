//
//  MovieInteractor.swift
//  Movies
//
//  Created by voldemort on 06/03/19.
//  Copyright © 2019 desafiotoken. All rights reserved.
//

import Foundation
import Alamofire

class MoviesServiceHTTP {
    static var URL_ENDPOINT = "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies"
    static func fetchMovies(_ success: @escaping (_ err:Any?,_ result: [Movie]) -> Void){
        Alamofire.request(MoviesServiceHTTP.URL_ENDPOINT).responseJSON { response in
            switch response.result {
            case .success:
                if let json = response.result.value as? NSArray{
                    let movies = json.map({ (v) -> Movie in return Movie(valueAny: v as? [String:Any])})
                    success(nil,movies)
                }
                break
            case .failure(let error):
                success(error,[])
            }
            
            
         }
    }
}
