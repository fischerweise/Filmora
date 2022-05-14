//
//  SearchRouter.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 24.04.2022.
//

import UIKit

class SearchRouter: PresenterToRouterSearchProtocol {
    
    static func createModule() -> UINavigationController {
        
        let viewController = SearchViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ViewToPresenterSearchProtocol & InteractorToPresenterSearchProtocol = SearchPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = SearchRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SearchInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    func pushToMovieDetail(on view: PresenterToViewSearchProtocol, movieID: Int) {
        let movieDetailViewController = MovieDetailRouter.createModule(movieID: movieID)
        
        let viewController = view as! SearchViewController
        viewController.navigationController?
            .pushViewController(movieDetailViewController, animated: true)
    }
}

