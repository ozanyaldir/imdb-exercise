//
//  MovieRepository.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation
import CoreData

class MovieRepository: NSObject, iMovieRepository {
    let context: NSManagedObjectContext
    weak var contentDelegate: MovieRepositoryContentDelegate? = nil
    
    let searchMoviesController: NSFetchedResultsController<Movie>
    
    
    init(context: NSManagedObjectContext) {
        self.context = context
        searchMoviesController = NSFetchedResultsController(
            fetchRequest: MovieRepository.searchMoviesFetchRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        super.init()
        searchMoviesController.delegate = self
    }
    
    func SetContentDelegate(delegate: MovieRepositoryContentDelegate){
        self.contentDelegate = delegate
    }
    
    private static var searchMoviesFetchRequest: NSFetchRequest<Movie>{
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Movie.title, ascending: true)]

        return request
      }
    
    
    func FetchMovies() -> ([MovieDetail]?, Error?){
        do {
            try searchMoviesController.performFetch()
            guard let movies = searchMoviesController.fetchedObjects else { return (nil, nil) }
            return (movies.map({MovieDetail(movie: $0)}), nil)
        } catch {
          return (nil, error)
        }
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

extension MovieRepository: NSFetchedResultsControllerDelegate {
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
      if let ms = controller.fetchedObjects as? [Movie] {
          self.contentDelegate?.moviesListDidChangeContent(ms.map({MovieDetail(movie: $0)}))
      }
  }
}
