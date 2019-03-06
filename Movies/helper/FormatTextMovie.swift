//
//  FormatTextMovie.swift
//  Movies
//
//  Created by voldemort on 06/03/19.
//  Copyright © 2019 desafiotoken. All rights reserved.
//

import Foundation

class FormatTextMovie {
    static func formatFromMovie(movie:Movie) -> String{
        var textToMovie = "O \(movie.title as! String) é um filme de \(movie.genres). Sua avaliação é \(movie.vote_average) de 10. Divirta-se :)"
        
        return textToMovie;
    }
}
