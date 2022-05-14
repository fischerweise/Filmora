//
//  FilmoraTests.swift
//  FilmoraTests
//
//  Created by Mustafa Pekdemir on 24.04.2022.
//

import XCTest
@testable import ViperMovies

class FilmoraTests: XCTestCase {
    var presenter: MovieDetailPresenter!
    var view: MockViewController!
    var interactor: MockInteractor!

    override func setUpWithError() throws {
        try? super.setUpWithError()
        view = .init()
        interactor = .init()
        presenter = MovieDetailPresenter?.self as? MovieDetailPresenter
    }

    override func tearDownWithError() throws {
       view = nil
        interactor = nil
        presenter = nil
    }

    func test_viewWillAppear_invokesRequiredViewMethods() {
        XCTAssertFalse(view.fetchMovieDetailSuccess, "Değer = true")
        XCTAssertFalse(view.fetchSimilarMoviesSuccess)
       XCTAssertTrue(view.fetchSimilarMoviesSuccess, "Değer = false")
        
    }
  func test_fetchMovies() throws {
        XCTAssertNil(presenter.movieDetail?.title, "Film ismi = true")
        
    }

}
