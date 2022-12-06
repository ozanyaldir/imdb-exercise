//
//  ContentViewAdapter.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation
import Combine
import SwiftUI
import CoreData

struct ErrorMessage: Identifiable {
    var id: String { message }
    let message: String
}

enum ViewError: Error {
    case message(ErrorMessage)
    case internalError(ErrorMessage)
}

class ContentViewAdapter: NSObject, ObservableObject {
    private let imdb: iIMDB
    private let movieRepository: iMovieRepository
    private let coordinator: iCoordinator
    
    @Published var movies: [MovieDetailViewModel] = []
    
    init(coordinator: iCoordinator, movieRepository: iMovieRepository, imdb: iIMDB) {
        self.movieRepository = movieRepository
        self.imdb = imdb
        self.coordinator = coordinator
        
        super.init()
        
        movieRepository.SetContentDelegate(delegate: self)
    }
    
    
    func SearchMovies(title: String, completion: @escaping (Result<[MovieDetail], ViewError>) -> Void){
        self.FetchMoviesFromCache()
        
        self.SearchMoviesinAPI(title: title, completion: completion)
    }
    
    func SearchMoviesinAPI(title: String, completion: @escaping (Result<[MovieDetail], ViewError>) -> Void){
        self.imdb.SearchMovies(title: title) { r in
            switch r {
            case .success(let m): return completion(.success(m.map({$0.toModel()})))
            case .failure(let err):
                switch err {
                case .errorMessage(let errM):
                    return completion(.failure(.message(ErrorMessage(message: errM))))
                case .internalError(let err):
                    return completion(.failure(.internalError(ErrorMessage(message: err.localizedDescription))))
                }
            }
        }
    }
    
    func CacheMovies(ms: [MovieDetail]){
        let _ = self.movieRepository.TruncateMoviesTable()
        let _ = self.movieRepository.InsertMovies(models: ms)
    }
    
    func FetchMoviesFromCache(){
        let (res, err) = movieRepository.FetchMovies()
        if let err = err {
            debugPrint(err)
            return
        }
        self.movies = res?.map({MovieDetailViewModel(m: $0)}) ?? []
    }
    
    func GetMovieDetailsPage(m: MovieDetailViewModel) -> MovieDetailView{
        return coordinator.MakeMovieDetailView(vm: m)
    }
}

extension ContentViewAdapter: MovieRepositoryContentDelegate{
    func moviesListDidChangeContent(_ movies: [MovieDetail]) {
        self.movies = movies.map({MovieDetailViewModel(m: $0)})
    }
}
