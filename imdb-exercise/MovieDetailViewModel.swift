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
    
    init(m: MovieDetail, r: MovieRatings?) {
        self.id = m.id
        self.title = m.title
        self.image = m.image
        self.type = m.resultType
        self.description = m.description
        
            self.fullTitle = r?.fullTitle
            self.type = r?.type
            self.year = r?.year
            self.imDb = r?.imDb
            self.metacritic = r?.metacritic
            self.theMovieDb = r?.theMovieDb
            self.rottenTomatoes = r?.rottenTomatoes
            self.filmAffinity = r?.filmAffinity
    }
    
    init(m: Movie) {
        self.id = m.id
        self.title = m.title
        self.image = m.image
        self.type = m.resultType
        self.description = m.descr
        
        self.fullTitle = m.fullTitle
        self.year = m.year
        self.imDb = m.imDb
        self.metacritic = m.metacritic
        self.theMovieDb = m.theMovieDb
        self.rottenTomatoes = m.rottenTomatoes
        self.filmAffinity = m.filmAffinity
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
