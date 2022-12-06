//
//  MovieRepository_protocol.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 6.12.2022.
//

import Foundation
import CoreData

protocol MovieRepositoryContentDelegate: AnyObject{
    func moviesListDidChangeContent(_ movies: [MovieDetail])
}

protocol iMovieRepository{
    var context: NSManagedObjectContext { get }
    var contentDelegate: MovieRepositoryContentDelegate? { get }
    
    
    func SetContentDelegate(delegate: MovieRepositoryContentDelegate)
    
    func FetchMovies() -> ([MovieDetail]?, Error?)
    func TruncateMoviesTable() -> Error?
    func InsertMovies(models: [MovieDetail]) -> Error?
    func UpdateMovieDetails(id: String, model: MovieDetail) -> Error?
    func UpdateMovieRatings(id: String, model: MovieRatings) -> Error?
}
