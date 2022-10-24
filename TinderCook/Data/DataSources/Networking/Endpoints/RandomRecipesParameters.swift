//
//  RandomRecipesParameters.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation

/// Paramters to find random (popular) recipes.
struct RandomRecipesParameters: FoodEndpointParameters {
    ///The tags (can be diets, meal types, cuisines, or intolerances) that the recipe must have.
    var tags: [String] = []
    /// The number of random recipes to be returned (between 1 and 100)
    var numberRecipes: Int = 5
    
    public var toDictionary: [String: Any] {
        return ["tags": tags, "number": numberRecipes]
    }
}
