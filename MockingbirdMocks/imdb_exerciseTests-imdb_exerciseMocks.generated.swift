//
//  imdb_exerciseTests-imdb_exerciseMocks.generated.swift
//  imdb_exercise
//
//  Generated by Mockingbird v0.20.0.
//  DO NOT EDIT
//

@testable import Mockingbird
@testable import imdb_exercise
import Alamofire
import Combine
import CoreData
import Foundation
import Kingfisher
import Swift
import SwiftUI

private let mkbGenericStaticMockContext = Mockingbird.GenericStaticMockContext()

// MARK: - Mocked iIMDB
public final class iIMDBMock: imdb_exercise.iIMDB, Mockingbird.Mock {
  typealias MockingbirdSupertype = imdb_exercise.iIMDB
  public static let mockingbirdContext = Mockingbird.Context()
  public let mockingbirdContext = Mockingbird.Context(["generator_version": "0.20.0", "module_name": "imdb_exercise"])

  fileprivate init(sourceLocation: Mockingbird.SourceLocation) {
    self.mockingbirdContext.sourceLocation = sourceLocation
    iIMDBMock.mockingbirdContext.sourceLocation = sourceLocation
  }

  // MARK: Mocked init(`baseURL`: String, `apiKey`: String)
  public required init(`baseURL`: String, `apiKey`: String) {
    self.mockingbirdContext.mocking.didInvoke(Mockingbird.SwiftInvocation(selectorName: "init(`baseURL`: String, `apiKey`: String)", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.ArgumentMatcher(`baseURL`), Mockingbird.ArgumentMatcher(`apiKey`)], returnType: Swift.ObjectIdentifier((Void).self)))
  }

  public func initialize(`baseURL`: @autoclosure () -> String, `apiKey`: @autoclosure () -> String) -> Mockingbird.Mockable<Mockingbird.FunctionDeclaration, (String, String) -> Void, Void> {
    return Mockingbird.Mockable<Mockingbird.FunctionDeclaration, (String, String) -> Void, Void>(context: self.mockingbirdContext, invocation: Mockingbird.SwiftInvocation(selectorName: "init(`baseURL`: String, `apiKey`: String)", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.resolve(`baseURL`), Mockingbird.resolve(`apiKey`)], returnType: Swift.ObjectIdentifier((Void).self)))
  }

  // MARK: Mocked `SearchMovies`(`title`: String)
  public func `SearchMovies`(`title`: String) async throws -> [imdb_exercise.MovieDetail] {
    return try await self.mockingbirdContext.mocking.didInvoke(Mockingbird.SwiftInvocation(selectorName: "`SearchMovies`(`title`: String) async throws -> [imdb_exercise.MovieDetail]", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.ArgumentMatcher(`title`)], returnType: Swift.ObjectIdentifier(([imdb_exercise.MovieDetail]).self))) {
      self.mockingbirdContext.recordInvocation($0)
      let mkbImpl = self.mockingbirdContext.stubbing.implementation(for: $0)
      if let mkbImpl = mkbImpl as? (String) async throws -> [imdb_exercise.MovieDetail] { return try await mkbImpl(`title`) }
      if let mkbImpl = mkbImpl as? () async throws -> [imdb_exercise.MovieDetail] { return try await mkbImpl() }
      for mkbTargetBox in self.mockingbirdContext.proxy.targets(for: $0) {
        switch mkbTargetBox.target {
        case .super:
          break
        case .object(let mkbObject):
          guard var mkbObject = mkbObject as? MockingbirdSupertype else { break }
          let mkbValue: [imdb_exercise.MovieDetail] = try await mkbObject.`SearchMovies`(title: `title`)
          self.mockingbirdContext.proxy.updateTarget(&mkbObject, in: mkbTargetBox)
          return mkbValue
        }
      }
      if let mkbValue = self.mockingbirdContext.stubbing.defaultValueProvider.value.provideValue(for: ([imdb_exercise.MovieDetail]).self) { return mkbValue }
      self.mockingbirdContext.stubbing.failTest(for: $0, at: self.mockingbirdContext.sourceLocation)
    }
  }

  public func `SearchMovies`(`title`: @autoclosure () -> String) async -> Mockingbird.Mockable<Mockingbird.ThrowingAsyncFunctionDeclaration, (String) async throws -> [imdb_exercise.MovieDetail], [imdb_exercise.MovieDetail]> {
    return Mockingbird.Mockable<Mockingbird.ThrowingAsyncFunctionDeclaration, (String) async throws -> [imdb_exercise.MovieDetail], [imdb_exercise.MovieDetail]>(context: self.mockingbirdContext, invocation: Mockingbird.SwiftInvocation(selectorName: "`SearchMovies`(`title`: String) async throws -> [imdb_exercise.MovieDetail]", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.resolve(`title`)], returnType: Swift.ObjectIdentifier(([imdb_exercise.MovieDetail]).self)))
  }

  // MARK: Mocked `GetMovieRatingsByID`(`id`: String)
  public func `GetMovieRatingsByID`(`id`: String) async throws -> imdb_exercise.MovieRatings {
    return try await self.mockingbirdContext.mocking.didInvoke(Mockingbird.SwiftInvocation(selectorName: "`GetMovieRatingsByID`(`id`: String) async throws -> imdb_exercise.MovieRatings", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.ArgumentMatcher(`id`)], returnType: Swift.ObjectIdentifier((imdb_exercise.MovieRatings).self))) {
      self.mockingbirdContext.recordInvocation($0)
      let mkbImpl = self.mockingbirdContext.stubbing.implementation(for: $0)
      if let mkbImpl = mkbImpl as? (String) async throws -> imdb_exercise.MovieRatings { return try await mkbImpl(`id`) }
      if let mkbImpl = mkbImpl as? () async throws -> imdb_exercise.MovieRatings { return try await mkbImpl() }
      for mkbTargetBox in self.mockingbirdContext.proxy.targets(for: $0) {
        switch mkbTargetBox.target {
        case .super:
          break
        case .object(let mkbObject):
          guard var mkbObject = mkbObject as? MockingbirdSupertype else { break }
          let mkbValue: imdb_exercise.MovieRatings = try await mkbObject.`GetMovieRatingsByID`(id: `id`)
          self.mockingbirdContext.proxy.updateTarget(&mkbObject, in: mkbTargetBox)
          return mkbValue
        }
      }
      if let mkbValue = self.mockingbirdContext.stubbing.defaultValueProvider.value.provideValue(for: (imdb_exercise.MovieRatings).self) { return mkbValue }
      self.mockingbirdContext.stubbing.failTest(for: $0, at: self.mockingbirdContext.sourceLocation)
    }
  }

  public func `GetMovieRatingsByID`(`id`: @autoclosure () -> String) async -> Mockingbird.Mockable<Mockingbird.ThrowingAsyncFunctionDeclaration, (String) async throws -> imdb_exercise.MovieRatings, imdb_exercise.MovieRatings> {
    return Mockingbird.Mockable<Mockingbird.ThrowingAsyncFunctionDeclaration, (String) async throws -> imdb_exercise.MovieRatings, imdb_exercise.MovieRatings>(context: self.mockingbirdContext, invocation: Mockingbird.SwiftInvocation(selectorName: "`GetMovieRatingsByID`(`id`: String) async throws -> imdb_exercise.MovieRatings", selectorType: Mockingbird.SelectorType.method, arguments: [Mockingbird.resolve(`id`)], returnType: Swift.ObjectIdentifier((imdb_exercise.MovieRatings).self)))
  }
}

/// Returns a concrete mock of `iIMDB`.
public func mock(_ type: imdb_exercise.iIMDB.Protocol, file: StaticString = #file, line: UInt = #line) -> iIMDBMock {
  return iIMDBMock(sourceLocation: Mockingbird.SourceLocation(file, line))
}
