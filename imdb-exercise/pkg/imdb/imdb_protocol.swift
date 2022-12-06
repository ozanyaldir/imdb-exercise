//
//  imdb_protocol.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 5.12.2022.
//

import Foundation

protocol iIMDB {
    func SearchMovies(title: String, completion: @escaping (Result<[MovieDetail], APIFailure>) -> Void)
    func GetMovieRatingsByID(id: String, completion: @escaping (Result<MovieRatings, APIFailure>) -> Void)
}
