//
//  MovieDetailAdapter.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 5.12.2022.
//

import Foundation
import Combine

protocol iMovieDetailAdapter{
    func FetchMovieRatings(completion: @escaping (Result<MovieDetailViewModel, ViewError>) -> Void)
    func FetchMovieRatingsFromAPI(id: String, completion: @escaping (Result<MovieRatings, ViewError>) -> Void)
}

class MovieDetailAdapter: NSObject, ObservableObject, iMovieDetailAdapter {
    let imdb: iIMDB
    
    @Published var viewModel: MovieDetailViewModel
    
    init(imdb: iIMDB, viewModel: MovieDetailViewModel) {
        self.imdb = imdb
        self.viewModel = viewModel
    }
    
    func FetchMovieRatings(completion: @escaping (Result<MovieDetailViewModel, ViewError>) -> Void){
        self.FetchMovieRatingsFromAPI(id: self.viewModel.id ?? "") {[unowned self] r in
            switch r {
            case .success(let mr):
                self.viewModel.fillRatingsInfo(r: mr)
                return completion(.success(self.viewModel))
            case .failure(let err):
                return completion(.failure(err))
            }
        }
    }
    
    func FetchMovieRatingsFromAPI(id: String, completion: @escaping (Result<MovieRatings, ViewError>) -> Void){
        self.imdb.GetMovieRatingsByID(id: id) { r in
            switch r {
            case .success(let m):
                return completion(.success(m))
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
}
