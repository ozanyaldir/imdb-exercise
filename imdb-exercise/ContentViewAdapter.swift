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

protocol iContentViewAdapter{
    func SearchMovies(title: String) async -> Void
    func SearchMoviesinAPI(title: String) async -> ([MovieDetail]?, ErrorMessage?)
    func CacheMovies(ms: [MovieDetail])
    func FetchMoviesFromCache()
    func GetMovieDetailsPage(m: MovieDetailViewModel) -> MovieDetailView
}

class ContentViewAdapter: NSObject, ObservableObject, iContentViewAdapter {
    private let imdb: iIMDB
    private let movieRepository: iMovieRepository
    private let coordinator: iCoordinator
    
    @Published var movies: [MovieDetailViewModel] = []
    @Published var alertMessage: ErrorMessage?
    
    init(coordinator: iCoordinator, movieRepository: iMovieRepository, imdb: iIMDB) {
        self.movieRepository = movieRepository
        self.imdb = imdb
        self.coordinator = coordinator
        
        super.init()
        
        movieRepository.SetContentDelegate(delegate: self)
    }
    
    
    func SearchMovies(title: String) async -> Void {
        let (r, err) = await self.SearchMoviesinAPI(title: title)
        
        DispatchQueue.main.async { [unowned self] in
            if let err = err {
                return self.alertMessage = err
            }
            
            guard let r = r else { return self.alertMessage = ErrorMessage(message: Response.internalError, type: .message) }
            
            self.CacheMovies(ms: r)
            
        }
    }
    
    func SearchMoviesinAPI(title: String) async -> ([MovieDetail]?, ErrorMessage?) {
        do {
            let r = try await self.imdb.SearchMovies(title: title)
            
            return (r, nil)
        }
        catch {
            guard let error = error as? APIFailure else {
                return (nil, ErrorMessage(message: error.localizedDescription, type: .internalError))
            }
            switch error {
            case .errorMessage(let errM):
                return (nil, ErrorMessage(message: errM, type: .message))
            case .internalError(let err):
                return (nil, ErrorMessage(message: err.localizedDescription, type: .internalError))
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
            return self.alertMessage = ErrorMessage(message: err.localizedDescription, type: .internalError)
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
