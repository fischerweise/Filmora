//
//  MockViewController.swift
//  FilmoraTests
//
//  Created by Mustafa Pekdemir on 3.05.2022.
//

import Foundation
@testable import ViperMovies

final class MockViewController: PresenterToViewMovieDetailProtocol {
    var fetchMovieDetailSuccess = false
    var fetchSimilarMoviesSuccess = false
    func onFetchMovieDetailSuccess() {
        fetchMovieDetailSuccess = true
    }
    
    func onFetchSimilarMoviesSuccess() {
        fetchSimilarMoviesSuccess = true
    }
}


