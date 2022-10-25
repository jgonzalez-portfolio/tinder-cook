//
//  RecipesDiscoverViewModel.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation
import SwiftUI

class RecipesDiscoverViewModel: ObservableObject {
    
    @Published var recipes: [RecipeModel] = []

    @ObservedObject var repository: RecipesRepositoryImplementation = .init()
    
    func getIndex(recipe: RecipeModel) -> Int {
        let index = recipes.firstIndex { currentRecipe in
            return currentRecipe.id == recipe.id
        }
        return index ?? 0
    }
    
    func fetchRandomRecipes() {
        var useCase = LoadRandomRecipesUseCase()
        useCase.repository = repository
        useCase.getRandomRecipes { result in
            switch result {
            case .success(let successValue):
                if let recipesRecived = successValue {
                    self.recipes = recipesRecived.map { RecipeModelMapper.mapDataModelToModel($0)}
                }
            case .failure(let failure):
                ()
            }
        }
    }
    
    func addRecipeToMyFavorites(_ currentRecipeId: Int) throws {
        guard let recipeToSave = self.recipes.first(where: { $0.id == currentRecipeId } ) else {
            throw DiscoverRecipeError.failMatchingRecipeId
        }
        var useCase = SaveRecipesUseCase()
        useCase.repository = repository
        useCase.saveRecipeToFavorite(recipeToSave)
        
    }
    
    func removeRecipeToMyFavorites(_ currentRecipeId: Int) {
        let recipeToRemove = self.recipes.first(where: { $0.id == currentRecipeId } )
    }
}
