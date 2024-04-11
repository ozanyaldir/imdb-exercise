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

/*
final class ContentViewAdapterTests: XCTestCase {
    
    var faker: Faker! = nil
    var ctx: NSManagedObjectContext! = nil
    
    var coordinator: Coordinator! = nil
    
    override func setUp() {
        self.faker = Faker(locale: "en-US")
        self.ctx = PersistenceController.preview.container.viewContext
        self.coordinator = Coordinator()
    }
    
    func test_should_succeed_SearchMovies() throws {
        let mck = mock(imdb_exercise.iIMDB.self)
        //let movieRepoMock = mock(imdb_exercise.iMovieRepository.self)
    }
}
 
 */

final class MovieDetailAdapterTests: XCTestCase {
    
    var faker: Faker! = nil
    
    var adapter: MovieDetailAdapter! = nil
    var vm: MovieDetailViewModel! = nil
    
    override func setUp() {
        self.faker = Faker(locale: "en-US")
        
        let ctx = PersistenceController.preview.container.viewContext
        let coordinator = Coordinator()
        
        let mrModel = MovieRatings(
            imDbId: faker.lorem.word(),
            title: faker.name.title(),
            fullTitle: faker.name.title(),
            type: faker.lorem.word(),
            year: faker.lorem.word(),
            imDb: faker.lorem.word(),
            metacritic: faker.lorem.word(),
            theMovieDb: faker.lorem.word(),
            rottenTomatoes: faker.lorem.word(),
            filmAffinity: faker.lorem.word()
        )
        
        let mModel = MovieDetail(
            id: faker.lorem.word(),
            resultType: faker.lorem.word(),
            image: faker.internet.url(),
            title: faker.name.title(),
            description: faker.lorem.words(amount: 4),
            movieRatings: mrModel
        )
        
        self.vm = MovieDetailViewModel(m: mModel)
    }
    
    func test_should_succeed_SearchMovies() async {
        
        let imdbMock = mock(imdb_exercise.iIMDB.self)
        given(try! await imdbMock.SearchMovies(title: "")).willReturn([])
        self.adapter = MovieDetailAdapter(imdb: imdbMock, viewModel: vm)
        
    }
}
