//
//  imdb_mock.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation

struct IMDBMock: iIMDB {
    func SearchMovies(title: String, completion: @escaping (Result<[MovieDetailDTO], APIFailure>) -> Void) {
        let m = MovieDetailDTO(
            id: "",
            resultType: "",
            image: "",
            title: "",
            description: ""
        )
        completion(.success([m]))
    }
    
    func GetMovieRatingsByID(id: String, completion: @escaping (Result<MovieRatingsDTO, APIFailure>) -> Void) {
        let m = MovieRatingsDTO(
            imDbId: "",
            title: "",
            fullTitle: "",
            type: "",
            year: "",
            imDb: "",
            metacritic: "",
            theMovieDb: "",
            rottenTomatoes: "",
            filmAffinity: "",
            errorMessage: nil
        )
        completion(.success(m))
    }
    
    
}
