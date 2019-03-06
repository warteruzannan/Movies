//
//  MoviesViewController.swift
//  Movies
//
//  Created by Warteruzannan on 06/03/19.
//  Copyright © 2019 desafiotoken. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialCards
import Kingfisher

protocol MoviesUIProtocol {
    func showMovies(movies: [Movie])
}

class MoviesViewController: UIViewController, MoviesUIProtocol, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var movies:[Movie] = [Movie(title:"A Cabana"), Movie(title:"Piratas do Caribe")]
    @IBOutlet weak var collectionViewMovies: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionViewMovies.delegate = self
        self.collectionViewMovies.dataSource = self
        
        self.collectionViewMovies.register(MDCCardCollectionCell.self, forCellWithReuseIdentifier: "MovieViewCell")
        MovieInteractor.fetchMovies()
     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieViewCell", for: indexPath) as! MDCCardCollectionCell
   
    
        cell.isSelectable = true

        cell.cornerRadius = 8
        cell.setShadowElevation(ShadowElevation(rawValue: 6), for: .selected)
        cell.setShadowColor(UIColor.black, for: .highlighted)
        
        //let imageView = UIImageView()
        let imageView = UIImageView(frame: cell.contentView.frame)
        let url = URL(string: "https://image.tmdb.org/t/p/w200/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg")
        imageView.kf.setImage(with: url)
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        
        cell.contentView.addSubview(imageView)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    

    func showMovies(movies: [Movie]) {
        self.movies = movies
        self.collectionViewMovies.reloadData()
    }
}
