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
    @State var swipeAction: ((Int, SwipeType) -> ())?
    @State var showingAlert: Bool = false
    @State var message: String = ""
    
    var body: some View {
        VStack {
            Button {
                print("123 algo")
            } label: {
                Image(systemName: "fork.knife.circle.fill")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay {
                Text("Discover")
                    .font(.title.bold())
            }
            .padding()
            
            // Recipes
            ZStack {
                if recipesDataStore.recipes.isEmpty {
                    HStack {
                        Text("Come back later... ")
                        ProgressView()
                    }
                } else {
                    ForEach(recipesDataStore.recipes.reversed(), id: \.self) { recipe in
                        StackRecipeCardView(recipe: recipe, action: $swipeAction)
                            .environmentObject(recipesDataStore)
                    }
                }
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Actions
            HStack(spacing: 15) {
                Button {
                    
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .padding(13)
                        .background(Color.gray)
                        .clipShape(Circle())
                }
                
                // action 2
                Button {
                    
                    doSwipeTo(.left)
                    
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .padding(18)
                        .background(Color.pink)
                        .clipShape(Circle())
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "star.fill")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .padding(13)
                        .background(Color.yellow)
                        .clipShape(Circle())
                }
                
                Button {
                doSwipeTo()
                } label: {
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .padding(18)
                        .background(Color.green)
                        .clipShape(Circle())
                }
 
            }
            .padding(.bottom)
            .alert(isPresented: self.$showingAlert) {
                Alert(title: Text("Hola"))
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear {
            fetchRecipes()
        }

    }
    
    func doSwipeTo(_ swipeType: SwipeType = .right) {
        guard let first = recipesDataStore.recipes.reversed().first,
              let id = first.id else { return }
        self.swipeAction?(id, swipeType)

        switch swipeType {
        case .right:
            let request = RecipesDiscoverModel.SaveRecipe.Request(recipeId: id)
            interactor?.addRecipeToMyFavorites(request)
        case .left:
            let request = RecipesDiscoverModel.RemoveRecipe.Request(recipeId: id)
            interactor?.removeRecipeToMyFavorites(request)
        }
        
    }
}

extension RecipesDiscoverView: RecipesDiscoverDisplayLogic {

    func displayRandomRecipes(viewModel: RecipesDiscoverModel.LoadRandomRecipes.ViewModel) {
        if let recipes = viewModel.recipesToSave {
            recipesDataStore.recipes = recipes
        }
    }
    
    func fetchRecipes() {
        let request = RecipesDiscoverModel.LoadRandomRecipes.Request()
        interactor?.fetchRandomRecipes(request)
    }
    
    func displayAlertError(error: DiscoverRecipesErrorModel) {
        self.message = error.message
        self.showingAlert = true

    }
}

public enum SwipeType {
    case right, left
}


// MARK: - Preview
struct RecipesDiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesDiscoverView()
    }
}

class DiscoverRecipesErrorModel: ObservableObject {
    @Published var showingAlert = false
    @Published var message = ""
    @Published var title = ""
}
