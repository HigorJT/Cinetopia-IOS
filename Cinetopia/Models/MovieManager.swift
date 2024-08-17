//
//  MovieManager.swift
//  Cinetopia
//
//  Created by Higor Jesus on 25/07/24.
//

import Foundation

class MovieManager {
    
    //Mark: - Attributes
    
    static let shared = MovieManager()
    var favoritesMovies: [Movie] = []
    
    //Mark: - Init
    
    private init() {}
    
    //mark: - Class methods
    
    func add(_ movie: Movie) {
        if favoritesMovies.contains(where: { $0.id == movie.id}) {
            remove(movie)
        } else {
            favoritesMovies.append(movie)
        }
    }
    
    func remove(_ movies: Movie) {
        if let index = favoritesMovies.firstIndex(where: { $0.id == movies.id}) {
            favoritesMovies.remove(at: index)
        }
    }
}
