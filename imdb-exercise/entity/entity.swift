//
//  entity.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 6.12.2022.
//

import Foundation
import CoreData

extension Movie {
    convenience init(context: NSManagedObjectContext, movieDetail: MovieDetail) {
        self.init(context: context)
        self.id = movieDetail.id
        self.resultType = movieDetail.resultType
        self.title = movieDetail.title
        self.image = movieDetail.image
        self.descr = movieDetail.description
        
        self.fullTitle = movieDetail.movieRatings?.fullTitle
        self.type = movieDetail.movieRatings?.type
        self.year = movieDetail.movieRatings?.year
        self.imDb = movieDetail.movieRatings?.imDb
        self.metacritic = movieDetail.movieRatings?.metacritic
        self.theMovieDb = movieDetail.movieRatings?.theMovieDb
        self.rottenTomatoes = movieDetail.movieRatings?.rottenTomatoes
        self.filmAffinity = movieDetail.movieRatings?.filmAffinity
    }
    
    func fillEntity(movieDetail: MovieDetail){
        self.resultType = movieDetail.resultType
        self.title = movieDetail.title
        self.image = movieDetail.image
        self.descr = movieDetail.description
        
        self.fullTitle = movieDetail.movieRatings?.fullTitle
        self.type = movieDetail.movieRatings?.type
        self.year = movieDetail.movieRatings?.year
        self.imDb = movieDetail.movieRatings?.imDb
        self.metacritic = movieDetail.movieRatings?.metacritic
        self.theMovieDb = movieDetail.movieRatings?.theMovieDb
        self.rottenTomatoes = movieDetail.movieRatings?.rottenTomatoes
        self.filmAffinity = movieDetail.movieRatings?.filmAffinity
    }
    
    func fillEntity(movieRatings: MovieRatings){
        self.fullTitle = movieRatings.fullTitle
        self.type = movieRatings.type
        self.year = movieRatings.year
        self.imDb = movieRatings.imDb
        self.metacritic = movieRatings.metacritic
        self.theMovieDb = movieRatings.theMovieDb
        self.rottenTomatoes = movieRatings.rottenTomatoes
        self.filmAffinity = movieRatings.filmAffinity
    }
}
