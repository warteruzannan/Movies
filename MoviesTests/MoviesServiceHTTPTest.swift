//
//  MoviesService.swift
//  MoviesTests
//
//  Created by Warteruzannan on 06/03/19.
//  Copyright © 2019 desafiotoken. All rights reserved.
//

import XCTest
@testable import Movies
class MoviesServiceHTTPTestXCTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTypeOfMovies() {
        MoviesServiceHTTP.fetchMovies { (err, movies) in
            if err != nil{
                XCTAssertTrue(type(of:movies) is NSArray)
            }
        }
    }
    
   
    
}
