//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by voldemort on 06/03/19.
//  Copyright © 2019 desafiotoken. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialCards

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var movieDescriptionText: UITextView!
    @IBOutlet weak var movieBannerImage: UIImageView!
    var movie:Movie!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        // Do any additional setup after loading the view.
    }
    
    
    func setupView(){
        let url = URL(string: movie.poster_url!)
        movieBannerImage.kf.setImage(with: url)
        movieBannerImage.layer.cornerRadius = 8
        movieBannerImage.layer.masksToBounds = true
        
        self.movieDescriptionText.text = movie.movieToString()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
