//
//  imdb_mock.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation

struct IMDBMock: iIMDB {
    func SearchMovies(title: String) async throws -> [MovieDetail] {
        let m = MovieDetailDTO(
            id: "",
            resultType: "",
            image: "",
            title: "",
            description: ""
        )
        return [m.toModel()]
    }
    
    func GetMovieRatingsByID(id: String) async throws -> MovieRatings {
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
        return m.toModel()
    }
    
    
}
