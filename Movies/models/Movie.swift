//
//  Movie.swift
//  Movies
//
//  Created by Warteruzannan on 06/03/19.
//  Copyright © 2019 desafiotoken. All rights reserved.
import Foundation

class Movie {
    var id: String?
    var vote_average: Double?
    var title:String?
    var genres: [Any]?
    var poster_url: String?
    var release_date: String?
    
    init (valueAny:[String:Any]?){
        self.id             = valueAny!["id"] as? String
        self.vote_average   = valueAny!["vote_average"] as? Double
        self.title          = valueAny!["title"] as? String
        self.genres         = valueAny!["genres"] as? [Any]
        self.poster_url     = valueAny!["poster_url"] as? String
        self.release_date   = valueAny!["release_date"] as? String
    }
    
    func movieToString() -> String{
        let __genres = self.genres == nil ? "alguma coisa (hehe)" : (self.genres as! [String]).joined(separator:", ")
        
        let year = String(release_date!.substring(to: release_date!.index(of: "-")!))
       
        let textToMovie = "O \(title ?? "") é um filme de \(__genres.lowercased()), lançado em \(year). Sua avaliação é \(vote_average ?? 0) de 10. Divirta-se :)"
        
        return textToMovie;
    }
}


