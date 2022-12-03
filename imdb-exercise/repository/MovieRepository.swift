//
//  MovieRepository.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation
import CoreData

protocol iMovieRepository{
    var context: NSManagedObjectContext { get }
    
    func TruncateMoviesTable() -> Error?
    func InsertMovies(models: [MovieDetail]) -> Error?
    func UpdateMovieDetails(id: String, model: MovieDetail) -> Error?
    func UpdateMovieRatings(id: String, model: MovieRatings) -> Error?
}

struct MovieRepository: iMovieRepository {
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func TruncateMoviesTable() -> Error? {
        do {
            let fetchRequest = Movie.fetchRequest()
            let objects = try self.context.fetch(fetchRequest)
            for object in objects {
                self.context.delete(object)
            }
            try self.context.save()
            return nil
            
        } catch {
            return error
        }
    }
    
    func InsertMovies(models: [MovieDetail]) -> Error? {
        let _ = models.map({$0.toEntity(ctx: self.context)})

        do {
            try self.context.save()
            return nil
        } catch {
            return error
        }
    }
    
    
    func UpdateMovieDetails(id: String, model: MovieDetail) -> Error? {
        do {
            let fetchRequest = Movie.fetchRequest()
            fetchRequest.predicate = NSPredicate(
                format: "id LIKE %@", id
            )
            let mes = try self.context.fetch(fetchRequest)
            if mes.count == 1 {
                var me = mes.first!
                model.fillEntity(movie: &me)
                
                try self.context.save()
                return nil
            }
            
            return nil
        } catch {
            return error
        }
    }
    
    func UpdateMovieRatings(id: String, model: MovieRatings) -> Error? {
        do {
            let fetchRequest = Movie.fetchRequest()
            fetchRequest.predicate = NSPredicate(
                format: "id LIKE %@", id
            )
            let mes = try self.context.fetch(fetchRequest)
            if mes.count == 1 {
                var me = mes.first!
                model.fillEntity(movie: &me)
                
                try self.context.save()
                return nil
            }
            
            return nil
        } catch {
            return error
        }
    }
    
}
