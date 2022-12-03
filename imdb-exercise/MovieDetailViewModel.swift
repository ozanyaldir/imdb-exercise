//
//  MovieDetailViewModel.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation

struct MovieDetailViewModel {
    let id: String?
    let title: String?
    let fullTitle: String?
    let image: URL?
    let type: String?
    let year: String?
    let imDb: String?
    let metacritic: String?
    let theMovieDb: String?
    let rottenTomatoes: String?
    let filmAffinity: String?
    
    init(m: MovieDetail, r: MovieRatings?) {
        self.id = m.id
        self.title = m.title
        self.image = m.image
        
            self.fullTitle = r?.fullTitle
            self.type = r?.type
            self.year = r?.year
            self.imDb = r?.imDb
            self.metacritic = r?.metacritic
            self.theMovieDb = r?.theMovieDb
            self.rottenTomatoes = r?.rottenTomatoes
            self.filmAffinity = r?.filmAffinity
    }
}
