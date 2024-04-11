//
//  imdb_protocol.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 5.12.2022.
//

import Foundation
import Alamofire

protocol iIMDB {
    init(apiKey: String)
    
    func SearchMovies(title: String) async throws -> [MovieDetail]
    func GetMovieRatingsByID(id: String) async throws -> MovieRatings
}

extension iIMDB {
}
