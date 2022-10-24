//
//  RecipesDiscoverView.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 22/10/2022.
//

import SwiftUI

struct RecipesDiscoverView: View {
    
    var interactor: RecipesDiscoverInteractor?
    @ObservedObject var recipesDataStore = RecipesDiscoverDataStore()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            fetchRecipes()
        }
    }
}

extension RecipesDiscoverView: RecipesDiscoverDisplayLogic {
    
    func displayRandomRecipes(viewModel: RecipesDiscoverModel.LoadRandomRecipes.ViewModel) {
        recipesDataStore.recipes = viewModel.recipes
    }
    
    func fetchRecipes() {
        let request = RecipesDiscoverModel.LoadRandomRecipes.Request()
        interactor?.fetchRandomRecipes(request)
    }
    
}


// MARK: - Preview
struct RecipesDiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesDiscoverView()
    }
}
