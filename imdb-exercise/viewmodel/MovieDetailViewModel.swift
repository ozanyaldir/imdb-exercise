//
//  MovieDetailViewModel.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation

struct MovieDetailViewModel: Identifiable, Hashable {
    let id: String?
    var title: String?
    var description: String?
    var fullTitle: String?
    var image: URL?
    var type: String?
    var year: String?
    var imDb: String?
    var metacritic: String?
    var theMovieDb: String?
    var rottenTomatoes: String?
    var filmAffinity: String?
    
    init(m: MovieDetail) {
        self.id = m.id
        self.title = m.title
        self.image = m.image
        self.type = m.resultType
        self.description = m.description
        
        self.fullTitle = m.movieRatings?.fullTitle
        self.type = m.movieRatings?.type
        self.year = m.movieRatings?.year
        self.imDb = m.movieRatings?.imDb
        self.metacritic = m.movieRatings?.metacritic
        self.theMovieDb = m.movieRatings?.theMovieDb
        self.rottenTomatoes = m.movieRatings?.rottenTomatoes
        self.filmAffinity = m.movieRatings?.filmAffinity
    }
    
    mutating func fillRatingsInfo(r: MovieRatings) {
        self.fullTitle = r.fullTitle
        self.type = r.type
        self.year = r.year
        self.imDb = r.imDb
        self.metacritic = r.metacritic
        self.theMovieDb = r.theMovieDb
        self.rottenTomatoes = r.rottenTomatoes
        self.filmAffinity = r.filmAffinity
    }
}
