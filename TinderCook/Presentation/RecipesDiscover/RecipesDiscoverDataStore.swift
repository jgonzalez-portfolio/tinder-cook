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
}
