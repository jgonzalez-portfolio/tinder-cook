//
//  RecipesDiscoverModel.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation

enum RecipesDiscoverModel {
    
   // Use cases
    enum LoadRandomRecipes {
        
        struct Request {
            var params: RandomRecipesParameters?
        }
        
        struct Response {
            var recipes: [Recipe]?
        }
        
        struct ViewModel {
            var recipesToSave: [Recipe]?
        }
    }
    
    enum SaveRecipe {
        
        struct Request {
            var recipeId: Int
        }
        
        struct Response {
            var recipe: Recipe?
        }
        
        struct ViewModel {
            var recipesToSave: [Recipe]?
        }
    }
    
    enum RemoveRecipe {
        
        struct Request {
            var recipeId: Int
        }
        
        struct Response {
            var recipe: Recipe?
        }
        
        struct ViewModel {
            var recipesToSave: [Recipe]?
        }
    }
}
