//
//  MovieDetailInteractor.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 24.04.2022.
//

import UIKit

class MovieDetailInteractor: PresenterToInteractorMovieDetailProtocol {
    
    var presenter: InteractorToPresenterMovieDetailProtocol?
    
    func loadMovieDetail(movieID: Int) {
        APIRequestHelper.sharedInstance.performRequest(req: MovieDetailRequest(param: movieID)) { [weak self] (responseModel) in
            self?.presenter?.getFethedMovieDetail(movieDetail: responseModel)
        }
    }
    
    func loadSimilarMovieDetail(movieID: Int) {
        APIRequestHelper.sharedInstance.performRequest(req: SimilarMovieRequest(param: movieID)) { [weak self] (responseModel) in
            guard let movies = responseModel.results else { return }
            self?.presenter?.getFethedSimilarMovies(movies: movies)
        }
    }
}
