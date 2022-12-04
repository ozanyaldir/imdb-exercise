//
//  ViewModelTests.swift
//  imdb-exerciseTests
//
//  Created by Ozan YALDIR on 4.12.2022.
//

import XCTest
import Fakery
import CoreData

final class MovieDetailViewModelTests: XCTestCase {
    
    var faker: Faker! = nil
    var ctx: NSManagedObjectContext! = nil
    
    override func setUp() {
        self.faker = Faker(locale: "en-US")
        self.ctx = PersistenceController.preview.container.viewContext
    }
    
    func test_should_succeed_fillEntity() throws {
        let mEntity = Movie(context: ctx)
        mEntity.id = faker.lorem.word()
        mEntity.resultType = faker.lorem.word()
        mEntity.title = faker.name.title()
        mEntity.image = URL(string: faker.internet.url())
        mEntity.descr = faker.lorem.words(amount: 5)
        
        var vm = MovieDetailViewModel(m: mEntity)
        
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
        
        vm.fillRatingsInfo(r: mrModel)
        
        
        XCTAssertEqual(mrModel.fullTitle, vm.fullTitle)
        XCTAssertEqual(mrModel.type, vm.type)
        XCTAssertEqual(mrModel.year, vm.year)
        XCTAssertEqual(mrModel.imDb, vm.imDb)
        XCTAssertEqual(mrModel.metacritic, vm.metacritic)
        XCTAssertEqual(mrModel.theMovieDb, vm.theMovieDb)
        XCTAssertEqual(mrModel.rottenTomatoes, vm.rottenTomatoes)
        XCTAssertEqual(mrModel.filmAffinity, vm.filmAffinity)
    }

}
