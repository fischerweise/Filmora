//
//  MockInteractor.swift
//  FilmoraTests
//
//  Created by Mustafa Pekdemir on 3.05.2022.
//

import Foundation
@testable import ViperMovies

final class MockInteractor: PresenterToViewMovieDetailProtocol {
    var invokedFetchMovie = false
    var invokedFetchMovieCount = 0
    
    func onFetchMovieDetailSuccess() {
        self.invokedFetchMovie = true
        self.invokedFetchMovieCount += 1
    }
    
    func onFetchSimilarMoviesSuccess() {
        self.invokedFetchMovie = true
        self.invokedFetchMovieCount += 1
    }
}

