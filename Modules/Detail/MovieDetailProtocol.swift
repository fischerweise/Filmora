//
//  MovieDetailProtocol.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 24.04.2022.
//

import UIKit

protocol ViewToPresenterMovieDetailProtocol: AnyObject {
    
    var view: PresenterToViewMovieDetailProtocol? { get set }
    var interactor: PresenterToInteractorMovieDetailProtocol? { get set }
    var router: PresenterToRouterMovieDetailProtocol? { get set }
    
    var movieDetail: MovieDetail? { get set }
    var similarMovies: [Movie]? { get set }
    
    func fetchMovieDetail(movieID: Int)
    
    func getMovieDetailModel() -> MovieDetail?
    func getSimilarMovies() -> [Movie]?
    
    func navigateToDetail(with movieId: Int)
}

protocol PresenterToViewMovieDetailProtocol: AnyObject {
    func onFetchMovieDetailSuccess()
    func onFetchSimilarMoviesSuccess()
}

protocol PresenterToInteractorMovieDetailProtocol: AnyObject {
    var presenter: InteractorToPresenterMovieDetailProtocol? { get set }
    
    func loadMovieDetail(movieID: Int)
    func loadSimilarMovieDetail(movieID: Int)
}

protocol InteractorToPresenterMovieDetailProtocol: AnyObject {
    func getFethedMovieDetail(movieDetail: MovieDetail)
    func getFethedSimilarMovies(movies: [Movie])
}

protocol PresenterToRouterMovieDetailProtocol: AnyObject {
    static func createModule(movieID: Int) -> UIViewController
    func pushToMovieDetail(on view: PresenterToViewMovieDetailProtocol, movieID: Int)
}
