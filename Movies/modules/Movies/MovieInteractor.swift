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
    static func fetchMovies(){
        Alamofire.request("https://desafio-mobile.nyc3.digitaloceanspaces.com/movies").responseJSON { response in
            if let json = response.result.value as? [String:AnyObject] {
                print("JSON: \(json)")
            }
        }
 
        
    }
}
