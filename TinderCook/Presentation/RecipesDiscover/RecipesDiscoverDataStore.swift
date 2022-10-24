//
//  RecipesDiscoverDataStore.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation
import SwiftUI

class RecipesDiscoverDataStore: ObservableObject {
    @Published var recipesToSave: [Recipe] = []
    
    func getIndex(recipe: Recipe) -> Int {
        
        let index = recipesToSave.firstIndex { currentRecipe in
            return currentRecipe == recipe
        }
        
        return index ?? 0
    }
}
