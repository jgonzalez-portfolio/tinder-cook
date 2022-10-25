//
//  FavoriteRecipesViewModel.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation
import SwiftUI

class FavoriteRecipesViewModel: ObservableObject {
    
    @Published var favoriteRecipes: [RecipeModel] = []
    var repository: RecipesRepositoryImplementation?
    
    func getFavoriteRecipes() {
        repository?.fetchFavoriteRecipes(with: nil, { result in
            self.favoriteRecipes = result
        })
    }
}
