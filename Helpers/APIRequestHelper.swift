//
//  APIRequestHelper.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 27.04.2022.
//

import UIKit

open class APIRequestHelper {
    static let sharedInstance = APIRequestHelper()
    
    private init(){}
    
    func performRequest<T: Requestable>(req: T, completionHandler: @escaping (T.ResponseType) -> ()){
        APIClient.shared.request(req: req) { (response) in
            switch response{
            case .success(let model):
                completionHandler(model)
            case .failure(_):
                 AlertHelper.alert("An error has occurred", message: "No internet connection found.", buttonTitle: "OK")
            case .failObject(let obj):
                if let failObj = obj, let failMessage = failObj.statusMessage{
                    AlertHelper.alert("Error", message: failMessage, buttonTitle: "OK")
                }
            }
        }
    }
}

