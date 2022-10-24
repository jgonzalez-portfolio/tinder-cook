//
//  RecipesDiscoverPresenterImplementation.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation

protocol RecipesDiscoverPresentationLogic {
    func displayRecipesFrom(response: RecipesDiscoverModel.LoadRandomRecipes.Response)
}

class RecipesDiscoverPresenterImplementation {
    var view: RecipesDiscoverDisplayLogic?
}

extension RecipesDiscoverPresenterImplementation: RecipesDiscoverPresentationLogic {
    
    func displayRecipesFrom(response: RecipesDiscoverModel.LoadRandomRecipes.Response) {
        let viewModel = RecipesDiscoverModel.LoadRandomRecipes.ViewModel(recipes: response.recipes)
        view?.displayRandomRecipes(viewModel: viewModel)
    }
}
