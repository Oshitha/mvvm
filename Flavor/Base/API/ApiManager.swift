//
//  ApiManager.swift
//  Flavor
//
//  Created by Oshitha on 2022-07-04.
//

import Foundation
import Combine
import Alamofire

struct Response<T> {
    let value: T
    let response: URLResponse
}


protocol APIService {
    func request<T: Decodable>(_ urlRequest: URLRequestBuilder) -> AnyPublisher<Response<T>, APIError>
}
  
class ApiManager:APIService {
    
        
    func request<T>(_ urlRequest: URLRequestBuilder) -> AnyPublisher<Response<T>, APIError> where T : Decodable {
        
        print("urlRequest.requestURL",urlRequest.requestURL)
        print("urlRequest.method",urlRequest.method)
        
        return AF.request(urlRequest.requestURL, method: urlRequest.method,headers: urlRequest.headers)
            .validate()
            .publishData()
            .tryMap{ result -> Response<T> in
                if let error = result.error {
                    if let errorData = result.data {
                        let value = try JSONDecoder().decode(ErrorData.self, from: errorData)
                        throw APIError.http(value)
                    }
                    else {
                        throw error
                    }
                }
                
                if let data = result.data {
                    let value = try JSONDecoder().decode(T.self, from: data)
                    return Response(value: value, response: result.response!)
                } else {
                    return Response(value: Empty.emptyValue() as! T, response: result.response!)
                }
            }
            .mapError({ (error) -> APIError in
                
                print("error.localizedDescription",error.localizedDescription)
                if let apiError = error as? APIError {
                    return apiError
                } else {
                    return .errorMsg(error.localizedDescription)
                }
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
   
}
