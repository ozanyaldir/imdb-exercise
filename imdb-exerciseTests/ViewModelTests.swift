//
//  ViewModelTests.swift
//  imdb-exerciseTests
//
//  Created by Ozan YALDIR on 4.12.2022.
//

import XCTest
import Fakery

final class MovieDetailViewModelTests: XCTestCase {
    
    var faker: Faker! = nil
    
    override func setUp() {
        self.faker = Faker(locale: "en-US")
    }
    
    func test_should_succeed_fillRatingsInfo() throws {
        let mModel = MovieDetail(
            id: faker.lorem.word(),
            resultType: faker.lorem.word(),
            image: faker.internet.url(),
            title: faker.name.title(),
            description: faker.lorem.words(amount: 4),
            movieRatings: nil
        )
        
        var vm = MovieDetailViewModel(m: mModel)
        
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
