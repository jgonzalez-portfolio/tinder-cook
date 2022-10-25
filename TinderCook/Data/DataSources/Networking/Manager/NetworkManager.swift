//
//  NetworkManager.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation

struct NetworkManager {
    
    private let routerFoodAPI = Router<FoodAPI>()

    static let environment: NetworkEnvironment = .mock
    
    func getRandomRecipies(with params: RandomRecipesParameters = .init()
                           ,_ completionHandler: @escaping (Result<[Recipe]?, DiscoverRecipeError>) -> Void) {
        
        routerFoodAPI.request(expectedData: FoodApiRandomRecipesResponse.self, from: .randomRecipes(params)) { response in
            
            switch response {
            case .success(let recipes):
                completionHandler(.success(recipes.data))
            case .failure(let error):
                if error.isResponseValidationError {
                    completionHandler(.failure(.BadConnection))
                }
                completionHandler(.failure(.failFetchRandomRecipes))
            }
        }
    }
}
