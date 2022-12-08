//
//  imdb_protocol.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 5.12.2022.
//

import Foundation

protocol iIMDB {
    func SearchMovies(title: String) async throws -> [MovieDetail]
    func GetMovieRatingsByID(id: String) async throws -> MovieRatings
}
