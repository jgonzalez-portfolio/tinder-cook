//
//  RecipesDiscoverViewConfigurator.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import SwiftUI

extension RecipesDiscoverView {
    
    func configurator() -> some View {
        var view = self
        let interactor = RecipesDiscoverInteractorImplementation()
        let presenter = RecipesDiscoverPresenterImplementation()
        let repository = RecipesRepositoryImplementation()
        interactor.repository = repository
        interactor.presenter = presenter
        view.interactor = interactor
        presenter.view = view
        return view
    }
}
