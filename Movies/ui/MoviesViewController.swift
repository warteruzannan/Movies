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
        self.navigationController?.navigationBar.barTintColor = UIColor.brown
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes            = [NSAttributedStringKey.foregroundColor: UIColor.white];
    }
    
}

class MoviesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var messagesIndicatorLabel: UILabel!
    var movies:[Movie] = []
    @IBOutlet weak var collectionViewMovies: UICollectionView!
    
    @IBOutlet weak var loadMoviesIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tryAgainButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColor()
        self.collectionViewMovies.delegate = self
        self.collectionViewMovies.dataSource = self
        
        self.collectionViewMovies.register(MDCCardCollectionCell.self, forCellWithReuseIdentifier: "MovieViewCell")
        self.collectionViewMovies.alpha = 0
        self.loadMoviesFromService("")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showLoadMovies(){
        self.messagesIndicatorLabel.text = "Carregando filmes..."
        self.loadMoviesIndicator.alpha = 1
        self.tryAgainButton.alpha = 0
        self.tryAgainButton.isEnabled = false
    }
    
    func showLoadError(){
        self.messagesIndicatorLabel.text = "Ops! Há algo errado."
        self.tryAgainButton.alpha = 1
        self.tryAgainButton.isEnabled = true
        self.loadMoviesIndicator.alpha = 0
    }
    
    @IBAction func loadMoviesFromService(_ sender: Any) {
        self.showLoadMovies()
        MoviesServiceHTTP.fetchMovies{ (err:Any?,movies:[Movie]) in
            if err == nil{
                self.movies = movies
                self.collectionViewMovies.reloadData()
                self.collectionViewMovies.alpha = 1
                
            }else{
                self.showLoadError()
            }
        }
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
