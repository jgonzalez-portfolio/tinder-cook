//
//  RecipesDiscoverDataStore.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation
import SwiftUI

class RecipesDiscoverDataStore: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    @Published var recipesFavorite: [Recipe] = []
    @Published var recipesLiked: [Recipe] = []
    @Published var recipesUnLiked: [Recipe] = []

    func getIndex(recipe: Recipe) -> Int {
        
        let index = recipes.firstIndex { currentRecipe in
            return currentRecipe == recipe
        }
        
        return index ?? 0
    }
}
