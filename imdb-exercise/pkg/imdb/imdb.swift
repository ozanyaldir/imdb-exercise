//
//  imdb.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation
import Alamofire

struct IMDB: iIMDB {
    fileprivate let baseURL: String
    fileprivate var apiKey: String
    
    let headers: HTTPHeaders = [
        .accept("application/json")
    ]
    
    init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    enum Paths {
        fileprivate static let searchMovies = "%@/SearchTitle/%@/%@"
        fileprivate static let getMovieRatingsByID = "%@/Ratings/%@/%@"
    }
    
    func SearchMovies(title: String) async throws -> [MovieDetail] {
        let url = String(format: Paths.searchMovies, baseURL, apiKey, title)
        
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
        let url = String(format: Paths.getMovieRatingsByID, baseURL, apiKey, id)
        
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
