//
//  RecipesDiscoverView.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 22/10/2022.
//

import SwiftUI

struct RecipesDiscoverView: View {
    
    @ObservedObject var viewModel: RecipesDiscoverViewModel = .init()
    
    @State var swipeAction: ((Int, SwipeType) -> ())?
    @State var showingAlert: Bool = false
    @State var message: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Favorites") {
                    FavoriteRecipesView().environmentObject(viewModel.repository)
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        Text("Discover")
                            .font(.title.bold())
                    }
                    .padding()
                
                // Recipes
                ZStack {
                    if viewModel.recipes.isEmpty {
                        HStack {
                            Text("Come back later... ")
                            ProgressView()
                        }
                    } else {
                        ForEach(viewModel.recipes.reversed(), id: \.self) { recipe in
                            StackRecipeCardView(recipe: recipe, action: $swipeAction)
                                .environmentObject(viewModel)
                        }
                    }
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Actions
                HStack(spacing: 15) {

                    CircleButton(name: "magnifyingglass",
                                 color: Color.gray,
                                 sizeByPriority: .low) {}
                    
                    CircleButton(name: "xmark",
                                 color: Color.pink,
                                 sizeByPriority: .medium) { doSwipeTo(.left) }
                    
                    CircleButton(name: "star.fill",
                                 color: Color.yellow,
                                 sizeByPriority: .low) { doSwipeTo(.left) }
                    
                    CircleButton(name: "suit.heart.fill",
                                 color: Color.green,
                                 sizeByPriority: .high) { doSwipeTo() }
                    
                }
                .padding(.bottom)
                .alert(isPresented: self.$showingAlert) {
                    Alert(title: Text("Ups hubo un error vuelva a intentar."))
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .onAppear {
                fetchRecipes()
            }
        }
        
    }
    
    func doSwipeTo(_ swipeType: SwipeType = .right) {
        guard let first = viewModel.recipes.reversed().first else { return }
        self.swipeAction?(first.id, swipeType)
    }
    
    func saveFavorite() {
        guard let first = viewModel.recipes.reversed().first else { return }
        do {
            try self.viewModel.addRecipeToMyFavorites(first.id)
        } catch {
            
        }
    }
    
    private func fetchRecipes() {
        viewModel.fetchRandomRecipes()
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
