//
//  NetworkManager.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation

struct NetworkManager {
    
    private let routerFoodAPI = Router<FoodAPI>()

    static let environment: NetworkEnvironment = .production
    
    func getRandomRecipies(with params: RandomRecipesParameters = .init()
                           ,_ completionHandler: @escaping (Result<[Recipe], NetworkError>) -> ()) {
        
        routerFoodAPI.request(expectedData: FoodApiRandomRecipesResponse<[Recipe]>.self, from: .randomRecipes(params)) { response in
            
            switch response {
            case .success(let recipes):
                if let datota = recipes.data {
                    completionHandler(.success(datota))
                } else {
                    completionHandler(.failure(.unwrapperError))
                }
            case .failure(_):
                completionHandler(.failure(.parametersNil))
            }
        }
    }
}
