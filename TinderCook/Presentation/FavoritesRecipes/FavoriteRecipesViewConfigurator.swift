//
//  FavoriteRecipesViewConfigurator.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation
import SwiftUI

extension FavoriteRecipesView {
    func configurator() -> some View {
        var view = self
        let presenter = FavoriteRecipesViewPresenterImplementation()
        let interactor = FavoriteRecipesViewInteractorImplementation()
        let repository = RecipesRepositoryImplementation()
        presenter.view = view
        interactor.presenter = presenter
        interactor.repository = repository
        view.interactor = interactor
        return view
    }
}
