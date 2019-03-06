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
//import ObjectMapper

class Movie {
    var title:String?
    
    init(title:String?){
        self.title = title
    }
}


