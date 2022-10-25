//
//  StackRecipeCardView.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 24/10/2022.
//

import SwiftUI

struct StackRecipeCardView: View {
    @EnvironmentObject var viewModel: RecipesDiscoverViewModel
    var recipe: RecipeModel
    @State var offset: CGFloat = 0
    @GestureState var isDraggin: Bool = false
    @State var endSwipe: Bool = false
    @Binding var action: ((Int, SwipeType) -> ())?
    
    var body: some View {
        GeometryReader { geometryProxy in
            let size = geometryProxy.size
            let frameWidth = size.width - 20.0
            let index = CGFloat(viewModel.getIndex(recipe: self.recipe))
            let topOffset = (index <= 2 ? index : 2) * 30
            
            ZStack {
                AsyncImage(url: recipe.getImageURL()) { recipeImg in
                    recipeImg
                        .resizable()
                        .frame(width: frameWidth, height: frameWidth)
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                        .cornerRadius(15)
                        .offset(y: -topOffset)
                    
                } placeholder: {
                    ProgressView()
                }
                
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .center)
        }
        .offset(x: offset)
        .rotationEffect(.init(degrees: getRotation(angle: 8)))
        .contentShape(Rectangle().trim(from: 0, to: endSwipe ? 0 : 1))
        .gesture(
            DragGesture()
                .updating($isDraggin,
                          body: { value, state, transaction in
                              state = true
                          })
                .onChanged({ value in
                    let translation = value.translation.width
                    offset = (isDraggin ? translation : .zero)
                })
                .onEnded({ value in
                    let width = rectScreenBound.width - 50
                    let translation = value.translation.width
                    
                    let checkingStatus = (translation > 0 ? translation : -translation)
                    withAnimation {
                        if checkingStatus > (width / 2) {
                            offset = (translation > 0 ? width : -width)  * 2
                            endSwipeAction()
                            if translation > 0 {
                                rightSwipe()
                            } else {
                                leftSwipe()
                            }
                        } else {
                            offset = .zero
                        }
                    }
                })
        )
        .onAppear {
            action = { value, swipe in
                let width = rectScreenBound.width - 50
                if value == recipe.id {
                    offset = ((swipe == .right) ? width : -width)  * 2
                    endSwipeAction()
                    if swipe == .right {
                        rightSwipe()
                    } else {
                        leftSwipe()
                    }
                }
                
                
            }
        }
    }
    
    func getRotation(angle: Double) -> Double {
        let rotation = (offset / (rectScreenBound.width - 50)) * angle
        return rotation
    }
    
    func endSwipeAction() {
        withAnimation(.none) {
            endSwipe = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let _ = viewModel.recipes.first {
                let _ = withAnimation {
                    viewModel.recipes.removeFirst()
                }
            }
        }
    }
    
    func leftSwipe() {
       // TODO: an action to left
    }
    
    func rightSwipe() {
        do {
            try viewModel.addRecipeToMyFavorites(recipe.id)
        } catch {
            
        }
    }
}

extension View {
    var rectScreenBound: CGRect {
        return UIScreen.main.bounds
    }
}

struct StackRecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesDiscoverView()
    }
}


