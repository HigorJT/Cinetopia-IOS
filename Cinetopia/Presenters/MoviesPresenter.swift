//
//  MoviesPresenter.swift
//  Cinetopia
//
//  Created by Higor Jesus on 30/07/24.
//

import UIKit

protocol MoviesPresenterToViewControllerProtocol: AnyObject {
    func setViewController(_ viewController: MoviesViewControllerToPresenterProtocol)
    func viewDidload()
    func viewDidAppear()
    
}

protocol MoviesPresenterToViewProtocol: AnyObject {
    func didSelect(movie: Movie)
    func didSelectFavoriteButton(_ movie: Movie)
    func didSearchText(_ searchBar: UISearchBar, textDidChange searchText: String, _ movies: [Movie], _ filteredMovies: inout [Movie])
}

class MoviesPresenter: MoviesPresenterToViewControllerProtocol {
 
    // Mark: - Attributes
    
    private var controller: MoviesViewControllerToPresenterProtocol?
    private var view: MoviesViewProtocol?
    private var interactor: MoviesPresenterToInteractorProtocol?

    
    // Mark: - Init
    
    init(view: MoviesViewProtocol, interactor: MoviesPresenterToInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    // Mark: - MoviesPresenterToViewControllerProtocol
    
    func setViewController(_ viewController: MoviesViewControllerToPresenterProtocol) {
        self.controller = viewController
        
    }
    
    func viewDidload() {
        view?.setPresenter(self)
        Task {
            await fetchMovies()
        }
    }
    
    func viewDidAppear() {
        view?.reloadData()
    }
    
    // Mark - Class methods
    
    private func fetchMovies() async {
        
        do {
            guard let movies = try await interactor?.fetchMovies() else { return }
            view?.setupView(with: movies)
            view?.reloadData()
        } catch (let error) {
            print(error)
        }
        
    }
}

extension MoviesPresenter: MoviesPresenterToViewProtocol {
    func didSelect(movie: Movie) {
        controller?.didSelectMovie(movie)
    }
    
    func didSelectFavoriteButton(_ movie: Movie) {
        movie.changeSelectionStatus()
        MovieManager.shared.add(movie)
    }
    
    func didSearchText(_ searchBar: UISearchBar, textDidChange searchText: String, _ movies: [Movie], _ filteredMovies: inout [Movie]) {
        if searchText.isEmpty {
            view?.toggle(false)
        } else {
            view?.toggle(true)
            filteredMovies = movies.filter({ movie in
                movie.title.lowercased().contains(searchText.lowercased())

            })
        }
    }
}
