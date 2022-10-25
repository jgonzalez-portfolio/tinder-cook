//
//  RecipesDiscoverPresenterImplementation.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation

protocol RecipesDiscoverPresentationLogic {
    func displayRecipesFrom(response: RecipesDiscoverModel.LoadRandomRecipes.Response)
    func displayAErrorFetchingRecipes(message: String)
}

class RecipesDiscoverPresenterImplementation {
    var view: RecipesDiscoverDisplayLogic?
}

extension RecipesDiscoverPresenterImplementation: RecipesDiscoverPresentationLogic {


    func displayRecipesFrom(response: RecipesDiscoverModel.LoadRandomRecipes.Response) {
        let viewModel = RecipesDiscoverModel.LoadRandomRecipes.ViewModel(recipesToSave: response.recipes)
        view?.displayRandomRecipes(viewModel: viewModel)
    }
    
    func displayAErrorFetchingRecipes(message: String) {
        let errorModel = DiscoverRecipesErrorModel()
        errorModel.message = message
        errorModel.showingAlert = true
        view?.displayAlertError(error: errorModel)
    }
}
