//
//  ContentViewAdapterTests.swift
//  imdb-exerciseTests
//
//  Created by Ozan YALDIR on 5.12.2022.
//

import XCTest
import Fakery
import CoreData
import Mockingbird

@testable import imdb_exercise

final class ContentViewAdapterTests: XCTestCase {
    
    var faker: Faker! = nil
    var ctx: NSManagedObjectContext! = nil
    
    var coordinator: Coordinator! = nil
    
    override func setUp() {
        self.faker = Faker(locale: "en-US")
        self.ctx = PersistenceController.preview.container.viewContext
        self.coordinator = Coordinator()
        
        let imdbMock = mock(imdb_exercise.iIMDB.self)
        let movieRepoMock = mock(imdb_exercise.iMovieRepository.self)
        
        
    }

}
