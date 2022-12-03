//
//  imdb_exerciseApp.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import SwiftUI

@main
struct imdb_exerciseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            let configManager = Config.shared
            let movieRepository = MovieRepository(context: persistenceController.container.viewContext)
            let imdb = IMDB(baseURL: configManager.GetIMDBAPIURL(), apiKey: configManager.GetIMDBAPIKey())
            let a = ContentViewAdapter(movieRepository: movieRepository, imdb: imdb)
            ContentView(adapter: a)
                .environment(\.managedObjectContext, movieRepository.context)
        }
    }
}
