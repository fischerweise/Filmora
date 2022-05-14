//
//  MovieDetailRouter.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 24.04.2022.
//

import UIKit


class MovieDetailRouter: PresenterToRouterMovieDetailProtocol {
    static func createModule(movieID: Int) -> UIViewController {
        let viewController = MovieDetailViewController()
        
        let presenter: ViewToPresenterMovieDetailProtocol & InteractorToPresenterMovieDetailProtocol = MovieDetailPresenter()
        
        viewController.movieID = movieID
        viewController.presenter = presenter
        viewController.presenter?.router = MovieDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MovieDetailInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }

    func pushToMovieDetail(on view: PresenterToViewMovieDetailProtocol, movieID: Int) {
        let movieDetailViewController = MovieDetailRouter.createModule(movieID: movieID)
        let viewController = view as! MovieDetailViewController
        viewController.navigationController?
            .pushViewController(movieDetailViewController, animated: true)
    }
}
