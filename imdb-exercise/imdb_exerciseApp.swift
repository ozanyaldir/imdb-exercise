//
//  imdb_exerciseApp.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import SwiftUI

@main
struct imdb_exerciseApp: App {
    fileprivate let contentView: ContentView!
    
    init() {
        let configManager = Config.shared
        let persistenceController = PersistenceController.shared
        
        let coordinator: iCoordinator = Coordinator(cm: configManager, pc: persistenceController)
        
        self.contentView = coordinator.MakeContentView()
    }

    var body: some Scene {
        WindowGroup {
            self.contentView
        }
    }
}
