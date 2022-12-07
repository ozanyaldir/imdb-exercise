//
//  model.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation
import CoreData

struct ErrorMessage: Identifiable {
    var id: String { message }
    let message: String
}

enum APIFailure: Error {
    case errorMessage(String)
    case internalError(Error)
}

class MovieDetail{
    let id: String?
    let resultType: String?
    let image: URL?
    let title: String?
    let description: String?
    
    let movieRatings: MovieRatings?
    
    init(
        id: String?,
        resultType: String?,
        image: String?,
        title: String?,
        description: String?,
        movieRatings: MovieRatings?
    ) {
        self.id = id
        self.resultType = resultType
        self.image = image != nil ? URL(string: image!) : nil
        self.title = title
        self.description = description
        self.movieRatings = movieRatings
    }
    
    init(
        movie: Movie
    ) {
        self.id = movie.id
        self.resultType = movie.resultType
        self.image = movie.image != nil ? movie.image : nil
        self.title = movie.title
        self.description = movie.descr
        
        self.movieRatings = MovieRatings(movie: movie)
    }
}

class MovieRatings {
    let imDbId: String?
    let title: String?
    let fullTitle: String?
    let type: String?
    let year: String?
    let imDb: String?
    let metacritic: String?
    let theMovieDb: String?
    let rottenTomatoes: String?
    let filmAffinity: String?
    
    init(
        imDbId: String?,
        title: String?,
        fullTitle: String?,
        type: String?,
        year: String?,
        imDb: String?,
        metacritic: String?,
        theMovieDb: String?,
        rottenTomatoes: String?,
        filmAffinity: String?
    ) {
        self.imDbId = imDbId
        self.title = title
        self.fullTitle = fullTitle
        self.type = type
        self.year = year
        self.imDb = imDb
        self.metacritic = metacritic
        self.theMovieDb = theMovieDb
        self.rottenTomatoes = rottenTomatoes
        self.filmAffinity = filmAffinity
    }
    
    init(movie: Movie) {
        self.imDbId = movie.id
        self.title = movie.title
        self.fullTitle = movie.fullTitle
        self.type = movie.type
        self.year = movie.year
        self.imDb = movie.imDb
        self.metacritic = movie.metacritic
        self.theMovieDb = movie.theMovieDb
        self.rottenTomatoes = movie.rottenTomatoes
        self.filmAffinity = movie.filmAffinity
    }
}
