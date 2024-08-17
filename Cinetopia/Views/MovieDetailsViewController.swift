//
//  MovieDetaillsViewController.swift
//  Cinetopia
//
//  Created by Higor Jesus on 19/07/24.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie: Movie
    
    private lazy var titlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.text = movie.title
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var posterImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        let url = URL(string: movie.image)
        imageView.kf.setImage(with: url)
        
        return imageView
        
    }()
    
    private lazy var userRatingLabel: UILabel = {
        
        let ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "Classificação dos usuários: \(movie.rate)"
        ratingLabel.textColor = .white
        ratingLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        ratingLabel.numberOfLines = 0
        //ratingLabel.textAlignment = .center
        
        return ratingLabel
        
    }()
    
    private lazy var synopsisLabel: UILabel = {
        
        let synopsis = UILabel()
        
        synopsis.translatesAutoresizingMaskIntoConstraints = false
        synopsis.text = movie.synopsis
        synopsis.textColor = .white
        synopsis.font = .systemFont(ofSize: 15, weight: .bold)
        synopsis.numberOfLines = 0
        
        return synopsis
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
    }
    
    
    
    private func addSubviews() {
        view.addSubview(titlelabel)
        view.addSubview(posterImage)
        view.addSubview(userRatingLabel)
        view.addSubview(synopsisLabel)
   
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            titlelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titlelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titlelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            posterImage.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 30),
            posterImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImage.widthAnchor.constraint(equalToConstant: 192.0),
            posterImage.heightAnchor.constraint(equalToConstant: 264.0),
            
            userRatingLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 30),
            userRatingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            synopsisLabel.topAnchor.constraint(equalTo: userRatingLabel.bottomAnchor, constant: 30),
            synopsisLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            synopsisLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            synopsisLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
            
            
    
        ])
    }
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

