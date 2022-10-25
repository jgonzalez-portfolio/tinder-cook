//
//  FavoriteRecipesViewInteractor.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

protocol FavoriteRecipesViewInteractor {
    
}

class FavoriteRecipesViewInteractorImplementation: FavoriteRecipesViewInteractor {
    var presenter: FavoriteRecipesPresentationLogic?
    var repository: RecipesRepository?
}

