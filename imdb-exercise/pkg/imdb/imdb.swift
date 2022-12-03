//
//  imdb.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation
import Alamofire

enum APIFailure: Error {
    case errorMessage(String)
    case internalError(Error)
}

protocol iIMDB {
    func SearchMovies(title: String, completion: @escaping (Result<[MovieDetailDTO], APIFailure>) -> Void)
    func GetMovieRatingsByID(id: String, completion: @escaping (Result<MovieRatingsDTO?, APIFailure>) -> Void)
}

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
    
    func SearchMovies(title: String, completion: @escaping (Result<[MovieDetailDTO], APIFailure>) -> Void) {
        let url = String(format: Paths.searchMovies, baseURL, apiKey, title)
        
        AF.request(url, headers: self.headers)
            .responseDecodable(of: MovieDetailResponseDTO.self) { response in
                switch response.result{
                case .success(let m):
                    if let em = m.errorMessage, em.count > 0{
                        return completion(.failure(APIFailure.errorMessage(em)))
                    }
                    
                    return completion(.success(m.results ?? []))
                case .failure(let err): return completion(.failure(APIFailure.internalError(err)))
                }
            }
    }
    
    func GetMovieRatingsByID(id: String, completion: @escaping (Result<MovieRatingsDTO?, APIFailure>) -> Void) {
        let url = String(format: Paths.getMovieRatingsByID, baseURL, apiKey, id)
        
        AF.request(url, headers: self.headers)
            .responseDecodable(of: MovieRatingsDTO.self) { response in
                switch response.result{
                case .success(let m):
                    if let em = m.errorMessage, em.count > 0{
                        return completion(.failure(APIFailure.errorMessage(em)))
                    }
                    
                    return completion(.success(m))
                case .failure(let err): return completion(.failure(APIFailure.internalError(err)))
                }
            }
    }
}
