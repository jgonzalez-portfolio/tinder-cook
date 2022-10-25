//
//  FavoriteRecipesView.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 24/10/2022.
//

import SwiftUI

struct FavoriteRecipesView: View {
    @EnvironmentObject var discoverData: RecipesDiscoverDataStore

    var body: some View {
        List {
            ForEach(discoverData.recipesLiked.reversed(), id: \.self) { recipe in
                NavigationLink(recipe.title ?? "Sin titulo") {
                    Text(recipe.title ?? "")
                }
            }
        }
    }
}

struct FavoriteRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRecipesView()
    }
}
