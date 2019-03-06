//
//  MovieInteractor.swift
//  Movies
//
//  Created by voldemort on 06/03/19.
//  Copyright © 2019 desafiotoken. All rights reserved.
//

import Foundation
import Alamofire

class MovieInteractor {
    
    static func fetchMovies(_ success: @escaping (_ result: [Movie]) -> Void){
        Alamofire.request("https://desafio-mobile.nyc3.digitaloceanspaces.com/movies").responseJSON { response in
            
            if let json = response.result.value as? NSArray{
                let movies = json.map({ (v) -> Movie in return Movie(valueAny: v as? [String:Any])})
                success(movies)
            }
         }
    }
}
