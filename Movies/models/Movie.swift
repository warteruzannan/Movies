//
//  Movie.swift
//  Movies
//
//  Created by Warteruzannan on 06/03/19.
//  Copyright © 2019 desafiotoken. All rights reserved.
// https://desafio-mobile.nyc3.digitaloceanspaces.com/movies
//{
//    "id": 19404,
//    "vote_average": 9.3,
//   "title": "Dilwale Dulhania Le Jayenge",
//    "poster_url": "https://image.tmdb.org/t/p/w200/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg",
//    "genres": [
//    "Comedy",
//    "Drama",
//    "Romance"
//    ],
//    "release_date": "1995-10-20"
//},

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
        self.vote_average   = valueAny!["id"] as? Double
        self.title          = valueAny!["title"] as? String
        self.genres         = valueAny!["genres"] as? [Any]
        self.poster_url     = valueAny!["poster_url"] as? String
        self.release_date   = valueAny!["release_date"] as? String
    }
}


