//
//  model.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation
import CoreData


class MovieDetail{
    let id: String?
    let resultType: String?
    let image: URL?
    let title: String?
    let description: String?
    
    init(
        id: String?,
        resultType: String?,
        image: String?,
        title: String?,
        description: String?
    ) {
        self.id = id
        self.resultType = resultType
        self.image = image != nil ? URL(string: image!) : nil
        self.title = title
        self.description = description
    }
    
    func toEntity(ctx: NSManagedObjectContext) -> Movie{
        let movie = Movie(context: ctx)
        movie.id = self.id
        movie.resultType = self.resultType
        movie.title = self.title
        movie.image = self.image
        movie.descr = self.description
        
        return movie
    }
    
    func fillEntity(movie: inout Movie){
        movie.id = self.id
        movie.resultType = self.resultType
        movie.title = self.title
        movie.image = self.image
        movie.descr = self.description
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
    
    func fillEntity(movie: inout Movie){
        movie.fullTitle = self.fullTitle
        movie.type = self.type
        movie.year = self.year
        movie.imDb = self.imDb
        movie.metacritic = self.metacritic
        movie.theMovieDb = self.theMovieDb
        movie.rottenTomatoes = self.rottenTomatoes
        movie.filmAffinity = self.filmAffinity
    }
}
