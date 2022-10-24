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
    
    var body: some View {
        VStack {
            Button {
                
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
                if recipesDataStore.recipesToSave.isEmpty {
                    HStack {
                        Text("Come back later... ")
                        ProgressView()
                    }

                } else {
                    ForEach(recipesDataStore.recipesToSave.reversed(), id: \.self) { recipe in
                        StackRecipeCardView(recipe: recipe, action: $swipeAction).environmentObject(recipesDataStore)
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
                    
                    doSwipe(to: .left)
                    
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
                doSwipe()
                } label: {
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .padding(18)
                        .background(Color.green)
                        .clipShape(Circle())
                }
 
            }.padding(.bottom)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear {
            fetchRecipes()
        }
    }
    
    func doSwipe(to: SwipeType = .right) {
        guard let first = recipesDataStore.recipesToSave.reversed().first, let id = first.id else { return }
        
        self.swipeAction?(id, to)
    }
    

}

extension RecipesDiscoverView: RecipesDiscoverDisplayLogic {
    
    func displayRandomRecipes(viewModel: RecipesDiscoverModel.LoadRandomRecipes.ViewModel) {
        if let recipes = viewModel.recipesToSave {
            recipesDataStore.recipesToSave = recipes
        }
    }
    
    func fetchRecipes() {
        let request = RecipesDiscoverModel.LoadRandomRecipes.Request()
        interactor?.fetchRandomRecipes(request)
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
