//
//  LoadRandomRecipesUseCase.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

struct LoadRandomRecipesUseCase {
    var params: RandomRecipesParameters?
    var repository: RecipesRepository?
    
    func getRandomRecipes(_ completionHandler: @escaping ((Result<[Recipe]?, DiscoverRecipeError>) -> ())) {
        repository?.fetchRandomRecipes(with: nil, completionHandler)
    }
    
}
