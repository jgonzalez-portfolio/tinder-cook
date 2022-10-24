//
//  RecipesRepository.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation

protocol RecipesRepository {
    func fetchRandomRecipes(with params: RandomRecipesParameters?,
                            _ completionHandler: @escaping (Result<[Recipe], Error>) -> Void)
}

class RecipesRepositoryImplementation {
    let networkManager: NetworkManager = .init()
}

extension RecipesRepositoryImplementation: RecipesRepository {
    
    func fetchRandomRecipes(with params: RandomRecipesParameters?,
                            _ completionHandler: @escaping (Result<[Recipe], Error>) -> Void) {
        
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
