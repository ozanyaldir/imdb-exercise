//
//  imdb.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation
import Alamofire

struct IMDB: iIMDB {
    fileprivate var apiKey: String
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    fileprivate static let baseURL: String = "https://imdb-api.com/API"
    
    let headers: HTTPHeaders = [
        .accept("application/json")
    ]
    
    fileprivate enum Paths {
        static let searchMovies = "%@/SearchTitle/%@/%@"
        static let getMovieRatingsByID = "%@/Ratings/%@/%@"
    }
    
    func SearchMovies(title: String) async throws -> [MovieDetail] {
        let url = String(format: Paths.searchMovies, IMDB.baseURL, apiKey, title)
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, headers: self.headers)
                .responseDecodable(of: MovieDetailResponseDTO.self) { response in
                    switch response.result{
                    case .success(let m):
                        if let em = m.errorMessage, em.count > 0{
                            return continuation.resume(with: .failure(APIFailure.errorMessage(em)))
                        }
                        
                        return continuation.resume(with: .success(m.results?.map({$0.toModel()}) ?? []))
                    case .failure(let err): return continuation.resume(with: .failure(APIFailure.internalError(err)))
                    }
                }
        }
    }
    
    func GetMovieRatingsByID(id: String) async throws -> MovieRatings {
        let url = String(format: Paths.getMovieRatingsByID, IMDB.baseURL, apiKey, id)
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, headers: self.headers)
                .responseDecodable(of: MovieRatingsDTO.self) { response in
                    switch response.result{
                    case .success(let m):
                        if let em = m.errorMessage, em.count > 0{
                            return continuation.resume(with: .failure(APIFailure.errorMessage(em)))
                        }
                        
                        return continuation.resume(with: .success(m.toModel()))
                    case .failure(let err): return continuation.resume(with: .failure(APIFailure.internalError(err)))
                    }
                }
        }
    }
}
