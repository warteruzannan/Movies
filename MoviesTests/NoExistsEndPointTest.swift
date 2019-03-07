//
//  NoExistsEndPointTest.swift
//  MoviesTests
//
//  Created by voldemort on 06/03/19.
//  Copyright © 2019 desafiotoken. All rights reserved.
//

import XCTest
@testable import Movies
class NoExistsEndPointTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTypeOfMovies() {
        MoviesServiceHTTP.URL_ENDPOINT = "fss"
        MoviesServiceHTTP.fetchMovies { (err, movies) in
            XCTAssertTrue(err != nil)
        }
    }
    
}
