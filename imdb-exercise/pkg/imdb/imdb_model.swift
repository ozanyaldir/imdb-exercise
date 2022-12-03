//
//  model.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation

struct MovieDetailResponseDTO: Decodable {
    let searchType: String?
    let expression: String?
    let results: [MovieDetailDTO]?
    let errorMessage: String?
    
    func toModel() -> [MovieDetail] {
        
        return self.results.map({$0.map({$0.toModel()})}) ?? []
        
        //var arr: [MovieDetail] = []
        //for m in self.results ?? []{
          //  arr.append(m.toModel())
        //}
        //return arr
    }
}

struct MovieDetailDTO: Decodable {
    let id: String?
    let resultType: String?
    let image: String?
    let title: String?
    let description: String?
    
    func toModel() -> MovieDetail {
        return MovieDetail(
            id: self.id,
            resultType: self.resultType,
            image: self.image,
            title: self.title,
            description: self.description
        )
    }
}

struct MovieRatingsDTO: Decodable {
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
    let errorMessage: String?
    
    func toModel() -> MovieRatings{
        return MovieRatings(
            imDbId: self.imDb,
            title: self.title,
            fullTitle: self.fullTitle,
            type: self.type,
            year: self.year,
            imDb: self.imDb,
            metacritic: self.metacritic,
            theMovieDb: self.theMovieDb,
            rottenTomatoes: self.rottenTomatoes,
            filmAffinity: self.filmAffinity
        )
    }
}

