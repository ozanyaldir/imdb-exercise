//
//  ModelTests.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 4.12.2022.
//

import XCTest
import Fakery
import CoreData

final class MovieDetailTests: XCTestCase {
    
    var faker: Faker! = nil
    var ctx: NSManagedObjectContext! = nil
    
    override func setUp() {
        self.faker = Faker(locale: "en-US")
        self.ctx = PersistenceController.preview.container.viewContext
    }
    
    func test_should_succeed_toEntity() throws {
        let mModel = MovieDetail(id: faker.lorem.word(), resultType: faker.lorem.word(), image: faker.internet.url(), title: faker.name.title(), description: faker.lorem.words(amount: 4), movieRating: nil)
        let mEntity = mModel.toEntity(ctx: ctx)
        
        XCTAssertEqual(mModel.id, mEntity.id)
        XCTAssertEqual(mModel.resultType, mEntity.resultType)
        XCTAssertEqual(mModel.image, mEntity.image)
        XCTAssertEqual(mModel.title, mEntity.title)
        XCTAssertEqual(mModel.description, mEntity.descr)
    }
    
    func test_should_succeed_fillEntity() throws {
        let mModel = MovieDetail(id: faker.lorem.word(), resultType: faker.lorem.word(), image: faker.internet.url(), title: faker.name.title(), description: faker.lorem.words(amount: 5), movieRating: nil)
        
        var mEntity = Movie(context: ctx)
        mEntity.id = faker.lorem.word()
        mEntity.resultType = faker.lorem.word()
        mEntity.title = faker.name.title()
        mEntity.image = URL(string: faker.internet.url())
        mEntity.descr = faker.lorem.words(amount: 5)
        
        mModel.fillEntity(movie: &mEntity)
        
        XCTAssertEqual(mModel.id, mEntity.id)
        XCTAssertEqual(mModel.resultType, mEntity.resultType)
        XCTAssertEqual(mModel.image, mEntity.image)
        XCTAssertEqual(mModel.title, mEntity.title)
        XCTAssertEqual(mModel.description, mEntity.descr)
    }

}

final class MovieRatingsTests: XCTestCase {
    
    var faker: Faker! = nil
    var ctx: NSManagedObjectContext! = nil
    
    override func setUp() {
        self.faker = Faker(locale: "en-US")
        self.ctx = PersistenceController.preview.container.viewContext
    }
    
    func test_should_succeed_fillEntity() throws {
        let mModel = MovieRatings(
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
        
        var mEntity = Movie(context: ctx)
        mEntity.id = faker.lorem.word()
        mEntity.resultType = faker.lorem.word()
        mEntity.title = faker.name.title()
        mEntity.image = URL(string: faker.internet.url())
        mEntity.descr = faker.lorem.words(amount: 5)
        
        mEntity.fullTitle = faker.name.title()
        mEntity.type = faker.lorem.word()
        mEntity.year = faker.lorem.word()
        mEntity.imDb = faker.lorem.word()
        mEntity.metacritic = faker.lorem.word()
        mEntity.theMovieDb = faker.lorem.word()
        mEntity.rottenTomatoes = faker.lorem.word()
        mEntity.filmAffinity = faker.lorem.word()
        
        mModel.fillEntity(movie: &mEntity)
        
        XCTAssertEqual(mModel.fullTitle, mEntity.fullTitle)
        XCTAssertEqual(mModel.type, mEntity.type)
        XCTAssertEqual(mModel.year, mEntity.year)
        XCTAssertEqual(mModel.imDb, mEntity.imDb)
        XCTAssertEqual(mModel.metacritic, mEntity.metacritic)
        XCTAssertEqual(mModel.theMovieDb, mEntity.theMovieDb)
        XCTAssertEqual(mModel.rottenTomatoes, mEntity.rottenTomatoes)
        XCTAssertEqual(mModel.filmAffinity, mEntity.filmAffinity)
    }

}
