//
//  NetworkError.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil"
    case missingUrl = "URL is nil"
    case unwrapperError = "There was an error during the unwrap data"
}
