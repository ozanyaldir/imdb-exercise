//
//  viewmodel.swift
//  imdb-exercise
//
//  Created by Ozan YALDIR on 7.12.2022.
//

import Foundation

enum ViewError: Error {
    case message(ErrorMessage)
    case internalError(ErrorMessage)
}
