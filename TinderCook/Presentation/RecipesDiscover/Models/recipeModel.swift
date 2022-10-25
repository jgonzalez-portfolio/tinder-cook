//
//  recipeModel.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

fileprivate struct Constant {
    static let placeHolder = "No-Image-Placeholder"
}

class RecipeModel: Hashable {

    let id: Int
    private let title: String?
    private let imageUrl: String?
    
    init(id: Int, title: String?, imageUrl: String?) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
    }

    func getImageURL() -> URL {
        guard let url = imageUrl, let finalURL =  URL(string: url) else {
            return URL(filePath: Constant.placeHolder)
        }
        return finalURL
    }
    
    func getTitle() -> String {
        return self.title ?? "No title available"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: RecipeModel, rhs: RecipeModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}
