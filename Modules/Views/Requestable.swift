//
//  Requestable.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 30.04.2022.
//

import Foundation


protocol Requestable {
    
    associatedtype ResponseType: Codable
    
    var endpoint: String { get }
    var method: APIClient.Method { get }
    var parameter: String? { get set }
    var headers: [String: String]? { get }
    var bodyParameters: [String: Any]? { get set}
    var filterParameters: [String: Any]? { get set}
    var timeout : TimeInterval { get }
    var cachePolicy : NSURLRequest.CachePolicy { get }
}

extension Requestable {
    
    var defaultJSONHeader : [String: String] {
        return ["accept" : "application/json" ,"Content-Type" : "application/json"]
    }
    
    var authorizationHeader: [String: String] {
        return ["accept": "application/json", "Content-Type" : "application/json", "Authorization": "Bearer " + ""]
    }
}

