//
//  enum.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation

enum ConfigKey{
    static let dbName = "DB_NAME"
    enum IMDB{
        static let apiURL = "IMDB_API_URL"
        static let apiKey = "IMDB_API_KEY"
    }
}

enum APIFailure: Error {
    case errorMessage(String)
    case internalError(Error)
}

