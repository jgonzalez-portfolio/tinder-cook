//
//  RecipesRepository.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation

protocol RecipesRepository {
    func fetchRandomRecipes(with params: RandomRecipesParameters?,
                            _ completionHandler: @escaping (Result<[Recipe]?, DiscoverRecipeError>) -> Void)
}

class RecipesRepositoryImplementation {
    let networkManager: NetworkManager = .init()
}

extension RecipesRepositoryImplementation: RecipesRepository {
    
    func fetchRandomRecipes(with params: RandomRecipesParameters?,_ completionHandler: @escaping (Result<[Recipe]?, DiscoverRecipeError>) -> Void) {
        
        networkManager.getRandomRecipies { result in
            switch result {
            case .success(let recipes):
                completionHandler(.success(recipes))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}

enum DiscoverRecipeError: String, Error {
    case failFetchRandomRecipes = "There was an error while unwrapping data"
    case BadConnection = "Ups! We had an error with internet connection"
}
