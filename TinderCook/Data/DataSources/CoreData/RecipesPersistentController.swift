//
//  RecipesPersistentController.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation
import CoreData

class RecipesPersistentController: NSObject, ObservableObject {
    
    @Published var favoritesRecipe: [Recipe] = []
    
    var container: NSPersistentContainer = .init(name: "RecipesDB")
    
    override init() {
        super.init()
        container.loadPersistentStores { store, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
