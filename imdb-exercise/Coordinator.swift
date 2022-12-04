//
//  Coordinator.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 4.12.2022.
//

import Foundation

protocol iCoordinator{
    func MakeContentView(pc: PersistenceController) -> ContentView
    func MakeMovieDetailView(vm: MovieDetailViewModel) -> MovieDetailView
}

struct Coordinator: iCoordinator {
    func MakeContentView(pc: PersistenceController) -> ContentView{
        let configManager = Config.shared
        let movieRepository = MovieRepository(context: pc.container.viewContext)
        let imdb = IMDB(baseURL: configManager.GetIMDBAPIURL(), apiKey: configManager.GetIMDBAPIKey())
        let a = ContentViewAdapter(coordinator: self, movieRepository: movieRepository, imdb: imdb)
        return ContentView(adapter: a)
    }
    
    func MakeMovieDetailView(vm: MovieDetailViewModel) -> MovieDetailView{
        return MovieDetailView(movieDetailViewModel: vm)
    }
}
