//
//  FavoriteMovieViewController.swift
//  Cinetopia
//
//  Created by Higor Jesus on 24/07/24.
//

import UIKit

protocol FavoriteMovieCollectionViewCellDelegate: AnyObject {
    
    func didSelectFavoriteButton(_ sender: UIButton)
}
class FavoriteMovieCollectionViewController: UICollectionViewCell {
    
    // Mark: - UI Compoanntes
    
    private lazy var moviePosterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        
        return imageView
        
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let iconImage = UIImage(systemName: "heart.fill")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        button.setImage(iconImage, for: .normal)
        button.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        
        return button
        
    }()
    
    weak var delegate: FavoriteMovieCollectionViewCellDelegate?
    
    // Mark: - View life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Class methods
    
    private func setupConstraints() {
        
        addSubview(moviePosterImage)
        moviePosterImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        moviePosterImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        moviePosterImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        moviePosterImage.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        addSubview(movieTitleLabel)
        movieTitleLabel.topAnchor.constraint(equalTo: moviePosterImage.bottomAnchor, constant: 12).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        addSubview(favoriteButton)
        favoriteButton.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 7).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        favoriteButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
    }
    
    func setupView(_ movie: Movie) {
        let url = URL(string: movie.image)
        moviePosterImage.kf.setImage(with: url)
        
        movieTitleLabel.text = movie.title
    }
    
    // MARK: - IBAction
    
    @objc
    func didTapFavoriteButton(_ sender: UIButton) {
        delegate?.didSelectFavoriteButton(sender)
    }
}

