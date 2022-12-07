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
        let imdbMock = mock(imdb_exercise.iIMDB.self)
        let movieRepoMock = mock(imdb_exercise.iMovieRepository.self)
    }
}
final class MovieDetailAdapterTests: XCTestCase {
    
    var faker: Faker! = nil
    
    var adapter: MovieDetailAdapter! = nil
    
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
        
        let imdbMock: iIMDB = mock(iIMDB.self)
        
        imdbMock.SearchMovies(title: mModel.title!) { r in
            debugPrint(r)
        }
        
        imdbMock.GetMovieRatingsByID(id: faker.name.title()) { r in
            debugPrint(r)
        }
        
        let vm = MovieDetailViewModel(m: mModel)
        
        
        self.adapter = MovieDetailAdapter(imdb: imdbMock, viewModel: vm)
    }
    
    func test_should_succeed_SearchMovies() throws {
        let argumentCaptor = ArgumentCaptor<(Result<[MovieDetail], APIFailure>) -> Void>()
        verify(self.adapter.imdb.SearchMovies(title: faker.name.title(), completion: argumentCaptor.matcher)).wasCalled()
        argumentCaptor.value?(.success([]))  // Prints Result.success
        
        self.adapter.FetchMovieRatingsFromAPI(id: faker.name.title(), completion: { r in
            debugPrint(r)
        })
    }
}

 */
