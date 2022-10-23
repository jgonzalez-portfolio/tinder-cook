//
//  NetworkRouterProtocol.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation

protocol NetworkRouterProtocol: AnyObject {
    associatedtype EndPoint: EndPointType
    func request<GenericObject: Decodable>(expectedData: GenericObject.Type,from route: EndPoint, completion: @escaping NetworkRouterCompletion<GenericObject>)
    func cancel()
}
