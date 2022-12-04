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
    let coordinator: iCoordinator = Coordinator()

    var body: some Scene {
        WindowGroup {
            coordinator.MakeContentView(pc: persistenceController)
        }
    }
}
