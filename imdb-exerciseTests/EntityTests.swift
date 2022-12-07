//
//  ModelTests.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 4.12.2022.
//

import XCTest
import Fakery
import CoreData

final class MovieEntityTests: XCTestCase {
    
    var faker: Faker! = nil
    var ctx: NSManagedObjectContext! = nil
    var movie: Movie! = nil
    
    override func setUp() {
        self.faker = Faker(locale: "en-US")
        self.ctx = PersistenceController.preview.container.viewContext
        
        let mModel = MovieDetail(
            id: faker.lorem.word(),
            resultType: nil,
            image: nil,
            title: nil,
            description: nil,
            movieRatings: nil
        )
        
        self.movie = Movie(context: self.ctx, movieDetail: mModel)
    }
    
    func test_should_succeed_fillEntityWithMovieDetail() throws {
        
        let mModel = MovieDetail(
            id: movie.id,
            resultType: faker.lorem.word(),
            image: faker.internet.url(),
            title: faker.name.title(),
            description: faker.lorem.words(amount: 4),
            movieRatings: nil
        )
        
        self.movie.fillEntity(movieDetail: mModel)
        
        XCTAssertEqual(mModel.id, self.movie.id)
        XCTAssertEqual(mModel.resultType, self.movie.resultType)
        XCTAssertEqual(mModel.image, self.movie.image)
        XCTAssertEqual(mModel.title, self.movie.title)
        XCTAssertEqual(mModel.description, self.movie.descr)
    }
    
    func test_should_succeed_fillEntityWithMovieRatings() throws {
        
        let mModel = MovieRatings(
            imDbId: movie.id,
            title: faker.lorem.word(),
            fullTitle: faker.lorem.word(),
            type: faker.lorem.word(),
            year: faker.lorem.word(),
            imDb: faker.lorem.word(),
            metacritic: faker.lorem.word(),
            theMovieDb: faker.lorem.word(),
            rottenTomatoes: faker.lorem.word(),
            filmAffinity: faker.lorem.word()
        )
        
        self.movie.fillEntity(movieRatings: mModel)
        
        XCTAssertEqual(mModel.imDbId, self.movie.id)
        XCTAssertEqual(mModel.fullTitle, self.movie.fullTitle)
        XCTAssertEqual(mModel.type, self.movie.type)
        XCTAssertEqual(mModel.year, self.movie.year)
        XCTAssertEqual(mModel.imDb, self.movie.imDb)
        XCTAssertEqual(mModel.metacritic, self.movie.metacritic)
        XCTAssertEqual(mModel.theMovieDb, self.movie.theMovieDb)
        XCTAssertEqual(mModel.rottenTomatoes, self.movie.rottenTomatoes)
        XCTAssertEqual(mModel.filmAffinity, self.movie.filmAffinity)
    }
     
}
