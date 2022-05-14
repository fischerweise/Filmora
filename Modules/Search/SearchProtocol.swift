//
//  SearchProtocol.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 24.04.2022.
//

import UIKit


protocol ViewToPresenterSearchProtocol: AnyObject {
    
    var view: PresenterToViewSearchProtocol? { get set }
    var interactor: PresenterToInteractorSearchProtocol? { get set }
    var router: PresenterToRouterSearchProtocol? { get set }
    
    func fetchMovie()
    func searchMovie(searchController: UISearchController)
    
    var nowPlayingMovies: [Movie]? { get set }
    var upcomingMovies: [Movie]? { get set }
    
    func numberOfRowsInSection() -> Int
    func cellNowPlayingMovie() -> [Movie]?
    func cellUpcomingMovie(indexPath: IndexPath) -> Movie?
    func cellSearchedMovie(indexPath: IndexPath) -> Movie?
    func searchedNumberOfRowsInSection() -> Int
    
    func navigateToDetail(with indexPath: IndexPath)
    func navigateToDetailFromSearched(with indexPath: IndexPath)
    func navigateToDetail(with movieId: Int)
}

protocol PresenterToViewSearchProtocol: AnyObject {
    func onFetchNowPlayingSuccess()
    func onFetchUpcomingPlayingSuccess()
    func getSearchFilteredMovies(movies: [Movie])
}

protocol PresenterToInteractorSearchProtocol: AnyObject {
    var presenter: InteractorToPresenterSearchProtocol? { get set }
    func loadNowPlayingMovies()
    func loadUpcomingMovies()
    func loadMovieWith(searchController: UISearchController)
}

protocol InteractorToPresenterSearchProtocol: AnyObject {
    func getFethedNowPlayingMovies(movies: [Movie])
    func getFethedUpcomingPlayingMovies(movies: [Movie])
    func getSearchedMovies(movies: [Movie])
}

protocol PresenterToRouterSearchProtocol: AnyObject {
    static func createModule() -> UINavigationController
    func pushToMovieDetail(on view: PresenterToViewSearchProtocol, movieID: Int)
}


