//
//  MoviesModelTest.swift
//  MoviesTests
//
//  Created by voldemort on 06/03/19.
//  Copyright © 2019 desafiotoken. All rights reserved.

import XCTest
@testable import Movies
class MoviesModelTest: XCTestCase {

    var movie:Movie!
    
    override func setUp() {
        super.setUp()
        let mockModel = [
            "id": 19404,
            "vote_average": 9.3,
            "title": "Dilwale Dulhania Le Jayenge",
            "poster_url": "https://image.tmdb.org/t/p/w200/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg",
            "genres": [
                "Comedy",
                "Drama",
                "Romance"
            ],
            "release_date": "1995-10-20"
            ] as [String : Any]
        self.movie = Movie(valueAny: mockModel)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreateToString() {
        let expectedString = "O Dilwale Dulhania Le Jayenge é um filme de comedy, drama, romance, lançado em 1995. Sua avaliação é 9.3 de 10. Divirta-se :)"
        XCTAssertTrue(expectedString == self.movie.movieToString())
    
    }
}
