//
//  manager.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 3.12.2022.
//

import Foundation

struct Config{
    
    static let `shared` = Config()
    
    
    func GetDBName() -> String{
        return Bundle.main.object(forInfoDictionaryKey: ConfigKey.dbName) as! String
    }
    
    func GetIMDBAPIURL() -> String{
        return Bundle.main.object(forInfoDictionaryKey: ConfigKey.IMDB.apiURL) as! String
    }
    
    func GetIMDBAPIKey() -> String{
        return Bundle.main.object(forInfoDictionaryKey: ConfigKey.IMDB.apiKey) as! String
    }
}
