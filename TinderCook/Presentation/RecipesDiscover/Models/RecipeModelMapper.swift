//
//  RecipeModelMapper.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

struct RecipeModelMapper {
    static func mapDataModelToModel(_ recipeDTO: Recipe) -> RecipeModel {
        return  .init(id: recipeDTO.id,
                     title: recipeDTO.title,
                     imageUrl: recipeDTO.image)
    }
}
 
