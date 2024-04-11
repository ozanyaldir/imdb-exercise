//
//  Coordinator.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 4.12.2022.
//

import Foundation

protocol iCoordinator{
    func MakeContentView() -> ContentView
    func MakeMovieDetailView(vm: MovieDetailViewModel) -> MovieDetailView
    
    func GetConfigManager() -> Config
    func GetMovieRepository() -> MovieRepository
}

struct Coordinator: iCoordinator {
    let configManager: Config
    let movieRepository: MovieRepository
    
    init(cm: Config, pc: PersistenceController) {
        self.configManager = cm
        self.movieRepository = MovieRepository(context: pc.container.viewContext)
    }
    
    func MakeContentView() -> ContentView{
        let imdb = IMDB(apiKey: self.configManager.GetIMDBAPIKey())
        let adapter = ContentViewAdapter(coordinator: self, movieRepository: self.movieRepository, imdb: imdb)
        return ContentView(adapter: adapter)
    }
    
    func MakeMovieDetailView(vm: MovieDetailViewModel) -> MovieDetailView{
        let imdb = IMDB(apiKey: self.configManager.GetIMDBAPIKey())
        let adapter = MovieDetailAdapter(imdb: imdb, viewModel: vm)
        return MovieDetailView(adapter: adapter)
    }
    
    func GetMovieRepository() -> MovieRepository {
        return self.movieRepository
    }
    
    func GetConfigManager() -> Config {
        return self.configManager
    }
}
