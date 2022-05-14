//
//  Error.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 25.04.2022.
//

import Foundation

class ErrorEntity: Codable {
    let statusCode: Int?
    let statusMessage: String?
    let success: Bool?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
}

