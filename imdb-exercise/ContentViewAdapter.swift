//
//  ContentViewAdapter.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation
import SwiftUI

enum ViewError: Error {
    case message(String)
    case internalError(Error)
}

class ContentViewAdapter {
    let imdb: iIMDB
    let movieRepository: iMovieRepository
    
    init(movieRepository: iMovieRepository, imdb: iIMDB) {
        self.movieRepository = movieRepository
        self.imdb = imdb
    }
    
    func SearchMovies(title: String, completion: @escaping (Result<[MovieDetail], ViewError>) -> Void){
        self.imdb.SearchMovies(title: title) { r in
            switch r {
            case .success(let m): return completion(.success(m.map({$0.toModel()})))
            case .failure(let err):
                switch err {
                case .errorMessage(let errM):
                    return completion(.failure(.message(errM)))
                case .internalError(let err):
                    return completion(.failure(.internalError(err)))
                }
            }
        }
    }
    
    func CacheMovies(ms: [MovieDetail]){
        let truncErr = self.movieRepository.TruncateMoviesTable()
        if (truncErr != nil){
            debugPrint(truncErr)
        }
        
        let insertErr = self.movieRepository.InsertMovies(models: ms)
        if (insertErr != nil){
            debugPrint(insertErr)
        }
    }
    
    func GetMovieDetailsPage(m: Movie) -> NavigationView<Text>{
        return NavigationView {
            Text("Item at \(m.title!)")
        }
    }
}
