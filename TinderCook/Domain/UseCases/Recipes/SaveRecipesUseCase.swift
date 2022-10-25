//
//  SaveRecipesUseCase.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

struct SaveRecipesUseCase {
    var params: RandomRecipesParameters?
    var repository: RecipesRepository?
    
    func saveRecipeToFavorite(_ recipe: RecipeModel) {
        repository?.saveToFavorites(recipe: recipe, {
            // TODO: Add a handler
        })
    }
    
}
