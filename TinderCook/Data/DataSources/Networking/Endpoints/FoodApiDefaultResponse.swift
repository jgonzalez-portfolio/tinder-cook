//
//  TCDefaultResponse.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation

struct FoodApiRandomRecipesResponse<T>: Decodable where T: Decodable {
    

    private(set) var data: T?
    
    enum CodingKeys: String, CodingKey {
        case data = "recipes"
    }
    
    init() {
        self.data = nil
    }
    
}
