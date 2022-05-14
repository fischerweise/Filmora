//
//  MovieList.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 24.04.2022.
//

import Foundation

final class NowPlayingRequest: Requestable {
    
    typealias ResponseType = MovieListEntity
    
    var endpoint: String {
        return Endpoints.now_playing
    }
    
    var method: APIClient.Method {
        return .get
    }
    
    var parameter: String?
    var bodyParameters: [String : Any]?
    
    var filterParameters: [String : Any]?
    
    var headers: [String : String]? {
        return defaultJSONHeader
    }
    
    var timeout: TimeInterval {
        return 20.0
    }
    
    var cachePolicy: NSURLRequest.CachePolicy {
        return .reloadIgnoringLocalAndRemoteCacheData
    }
}


final class UpcomingRequest: Requestable {
    
    
    
    typealias ResponseType = MovieListEntity
    
    var endpoint: String {
        return Endpoints.upcoming
    }
    
    var method: APIClient.Method {
        return .get
    }
    
    var parameter: String?
    var bodyParameters: [String : Any]?
    var filterParameters: [String : Any]?
    
    var headers: [String : String]? {
        return defaultJSONHeader
    }
    
    var timeout: TimeInterval {
        return 20.0
    }
    
    var cachePolicy: NSURLRequest.CachePolicy {
        return .reloadIgnoringLocalAndRemoteCacheData
    }
}


final class SearchMovieRequest: Requestable {
    
    typealias ResponseType = MovieListEntity
    
    init(filterParams: [String: Any]) {
        self.filterParameters = filterParams
    }
    
    var endpoint: String {
        return Endpoints.movie_search
    }
    
    var method: APIClient.Method {
        return .get
    }
    
    var parameter: String?
    var bodyParameters: [String : Any]?
    var filterParameters: [String : Any]?
    
    var headers: [String : String]? {
        return defaultJSONHeader
    }
    
    var timeout: TimeInterval {
        return 20.0
    }
    
    var cachePolicy: NSURLRequest.CachePolicy {
        return .reloadIgnoringLocalAndRemoteCacheData
    }
}


class MovieListEntity: Codable {
    
    let results: [Movie]?
    let page, totalResults: Int?
    let dates: Dates?
    let totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case results, page
        case totalResults
        case dates
        case totalPages
    }
    
    init(results: [Movie]?, page: Int?, totalResults: Int?, dates: Dates?, totalPages: Int?) {
        self.results = results
        self.page = page
        self.totalResults = totalResults
        self.dates = dates
        self.totalPages = totalPages
    }
}

class Dates: Codable {
    let maximum, minimum: String?
    
    init(maximum: String?, minimum: String?) {
        self.maximum = maximum
        self.minimum = minimum
    }
}

class Movie: Codable {
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let posterPath: String?
    let id: Int?
    let adult: Bool?
    let backdropPath: String?
    let originalLanguage: String?
    let originalTitle: String?
    let genreIDS: [Int]?
    let title: String?
    let voteAverage: Double?
    let overview: String?
    let releaseDate: String?
    
    
    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id
        case adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
    
}
