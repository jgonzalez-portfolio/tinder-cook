//
//  TCRouter.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation
import Alamofire

public typealias NetworkRouterCompletion<GenericObject: Decodable> = (_ response: Result<GenericObject, AFError>) -> ()

class Router<EndPoint: EndPointType>: NetworkRouterProtocol {
    private var task: URLSessionTask?
    
    func request<GenericObject: Decodable>(expectedData: GenericObject.Type,from route: EndPoint, completion: @escaping NetworkRouterCompletion<GenericObject>) {
        
        let secretParam = ["apiKey":"68eb9c0df3a542609dd2da1399cf4f9c"]
        
        let request = AF.request(route.endpointURL, method: route.httpMethod, parameters: route.parameters?.combine(secretParam), headers: route.headers)
        
        request.validate().responseData { response in
            print("123 ", response.request?.urlRequest ?? "No URL")
            
            switch response.result {
            case .success(let dataResponse):
                
                do {
                    if let responseDecoded = try? JSONDecoder().decode(GenericObject.self, from: dataResponse) {
                        completion(.success(responseDecoded))
                    }
                }

            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    func cancel() {
        AF.cancelAllRequests()
    }
}
