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

extension UIViewController{
    func setupColor(){
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes            = [NSAttributedStringKey.foregroundColor: UIColor.white];
    }
    
}

class MoviesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var movies:[Movie] = []
    @IBOutlet weak var collectionViewMovies: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColor()
        self.collectionViewMovies.delegate = self
        self.collectionViewMovies.dataSource = self
        
        self.collectionViewMovies.register(MDCCardCollectionCell.self, forCellWithReuseIdentifier: "MovieViewCell")
        
        MovieInteractor.fetchMovies{ (movies:[Movie]) in
            self.movies = movies
            self.collectionViewMovies.reloadData()
        }

     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "MoviesListToDetailsWith" {
            if let movie = sender as? Movie{
                if let movieDetailsViewController = segue.destination as? MovieDetailsViewController{
                    movieDetailsViewController.movie = movie;
                }
            }
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieToDetails = self.movies[indexPath.row]
        self.performSegue(withIdentifier: "MoviesListToDetailsWith" , sender: movieToDetails);
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieViewCell", for: indexPath) as! MDCCardCollectionCell
   
    
        self.setupCell(cell: cell, indexPath: indexPath)
        
        return cell
        
    }
    
    
    // Cofigura os daos da cell
    func setupCell(cell:MDCCardCollectionCell, indexPath: IndexPath){
       
        let movie = self.movies[indexPath.row]
        
        cell.isSelectable = true
        cell.cornerRadius = 8
        cell.setShadowElevation(ShadowElevation(rawValue: 6), for: .selected)
        cell.setShadowColor(UIColor.black, for: .highlighted)
        
        
        let imageView = UIImageView(frame: cell.contentView.frame)
        let url = URL(string: movie.poster_url!)
        imageView.kf.setImage(with: url)
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        
        cell.contentView.addSubview(imageView)
    }
    
    // Para deixar a collection view com apenas duas columas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  60
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
}
