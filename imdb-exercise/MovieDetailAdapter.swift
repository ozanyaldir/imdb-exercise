//
//  MovieDetailAdapter.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 5.12.2022.
//

import Foundation
import Combine

protocol iMovieDetailAdapter{
    func FetchMovieRatings() async
    func FetchMovieRatingsFromAPI(id: String) async -> (MovieRatings?, ErrorMessage?)
}

class MovieDetailAdapter: NSObject, ObservableObject, iMovieDetailAdapter {
    let imdb: iIMDB
    
    @Published var viewModel: MovieDetailViewModel
    @Published var alertMessage: ErrorMessage?
    
    init(imdb: iIMDB, viewModel: MovieDetailViewModel) {
        self.imdb = imdb
        self.viewModel = viewModel
    }
    
    func FetchMovieRatings() async {
        guard let movieID = self.viewModel.id else {
            return
        }
        
        let (mr, err) = await self.FetchMovieRatingsFromAPI(id: movieID)
        
        DispatchQueue.main.async { [unowned self] in
            if let err = err {
                return self.alertMessage = err
            }
            
            guard let mr = mr else { return self.alertMessage = ErrorMessage(message: Response.internalError, type: .message) }
            
            self.viewModel.fillRatingsInfo(r: mr)
        }
    }
    
    func FetchMovieRatingsFromAPI(id: String) async -> (MovieRatings?, ErrorMessage?) {
        do {
            let r = try await self.imdb.GetMovieRatingsByID(id: id)
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
}
