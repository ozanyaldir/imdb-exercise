//
//  movie_repository_mock.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation
import CoreData

class MovieRepositoryMock: iMovieRepository{
    var contentDelegate: MovieRepositoryContentDelegate?
    
    var context: NSManagedObjectContext
    
    
    func SetContentDelegate(delegate: MovieRepositoryContentDelegate) {
        self.contentDelegate = delegate
    }
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func FetchMovies() -> ([MovieDetail]?, Error?) {
        return ([], nil)
    }
    
    func TruncateMoviesTable() -> Error? {
        return nil
    }
    
    func InsertMovies(models: [MovieDetail]) -> Error? {
        return nil
    }
    
    func UpdateMovieDetails(id: String, model: MovieDetail) -> Error? {
        return nil
    }
    
    func UpdateMovieRatings(id: String, model: MovieRatings) -> Error? {
        return nil
    }
}
