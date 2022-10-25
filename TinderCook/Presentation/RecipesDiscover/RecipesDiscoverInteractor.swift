//
//  RecipesDiscoverInteractor.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation

protocol RecipesDiscoverInteractor {
    func fetchRandomRecipes(_ request: RecipesDiscoverModel.LoadRandomRecipes.Request)
    func addRecipeToMyFavorites(_ request: RecipesDiscoverModel.SaveRecipe.Request)
    func removeRecipeToMyFavorites(_ request: RecipesDiscoverModel.RemoveRecipe.Request)
}

class RecipesDiscoverInteractorImplementation {
    var presenter: RecipesDiscoverPresentationLogic?
    var repository: RecipesRepository?

}

extension RecipesDiscoverInteractorImplementation: RecipesDiscoverInteractor {

    
    func fetchRandomRecipes(_ request: RecipesDiscoverModel.LoadRandomRecipes.Request) {
        repository?.fetchRandomRecipes(with: request.params, { [weak self] result in
            switch result {
            case .success(let success):
                let response = RecipesDiscoverModel.LoadRandomRecipes.Response(recipes: success)
                self?.presenter?.displayRecipesFrom(response: response)
            case .failure(let failure):
                self?.presenter?.displayAErrorFetchingRecipes(message: failure.localizedDescription)
            }
        })
    }
    
    func addRecipeToMyFavorites(_ request: RecipesDiscoverModel.SaveRecipe.Request) {
        ()
    }
    
    func removeRecipeToMyFavorites(_ request: RecipesDiscoverModel.RemoveRecipe.Request) {
        
    }
    
}
