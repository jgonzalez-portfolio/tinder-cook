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
        
        let secretParam = ["apiKey":"1a50f6bc70db47a599b590b9838d55c3"]
        
        let request = AF.request(route.endpointURL, method: route.httpMethod, parameters: route.parameters?.combine(secretParam), headers: route.headers)
        
        request.validate().responseData { response in
            print("123 ", response.request?.urlRequest ?? "No URL")
            print("123 \(response.debugDescription)")
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
