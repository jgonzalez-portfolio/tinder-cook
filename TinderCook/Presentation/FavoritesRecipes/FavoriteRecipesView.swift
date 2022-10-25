//
//  FavoriteRecipesView.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 24/10/2022.
//

import SwiftUI

struct FavoriteRecipesView: View {
    @ObservedObject var viewModel: FavoriteRecipesViewModel = .init()
    @EnvironmentObject var repository: RecipesRepositoryImplementation
    
    var body: some View {
        List {
            ForEach(viewModel.favoriteRecipes, id: \.self) { recipe in
                HStack {
                    AsyncImage(url: recipe.getImageURL()) { recipeImg in
                        recipeImg
                            .resizable()
                            .frame(width: 40, height: 40)
                            .aspectRatio(contentMode: .fit)
                            .scaledToFill()
                            .cornerRadius(5)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    Text(recipe.getTitle())

                }
            }
        }.onAppear {
            viewModel.repository = repository
            viewModel.getFavoriteRecipes()
        }
    }
}
struct FavoriteRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRecipesView()
    }
}
