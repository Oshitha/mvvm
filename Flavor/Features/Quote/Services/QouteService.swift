//
//  QouteService.swift
//  Flavor
//
//  Created by Oshitha on 2022-06-30.
//

import Foundation
import Combine

enum services :String{
    case quotes = "/api/quotes"
}

protocol QouteService{
    func fetchRandomQoutes() async throws ->[Quote]
    func getQuoteList(endPoint: QuoteAPIs) -> AnyPublisher<[QuotesResponseElementElement], APIError>
}

final class QouteServiceImpl: QouteService{
    
    var apiManager: ApiManager
    
    init(apiManager: ApiManager = ApiManager()){
        self.apiManager = apiManager
    }
    
    func getQuoteList(endPoint: QuoteAPIs) -> AnyPublisher<[QuotesResponseElementElement], APIError> {
        return apiManager.request(endPoint.resolve()).map(\.value).eraseToAnyPublisher()
    }
    
    func fetchRandomQoutes() async throws -> [Quote] {
    
        //HTTP Client can be changed
        //this can be change according to the requirement
        // Ex- Almofire,Moya
        let urlSession  = URLSession.shared
        let url = URL(string: APIConstants.baseUrl.appending(services.quotes.rawValue))
        
        print("url",url)
        let (data,_ ) = try await urlSession.data(from: url!)
        
        return try JSONDecoder().decode([Quote].self,from: data)
    }
}
