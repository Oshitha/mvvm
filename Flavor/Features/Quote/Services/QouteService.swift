//
//  QouteService.swift
//  Flavor
//
//  Created by Oshitha on 2022-06-30.
//

import Foundation

enum services :String{
    case quotes = "/api/quotes"
}

protocol QouteService{
    func fetchRandomQoutes() async throws ->[Quote]
}

final class QouteServiceImpl: QouteService{
    
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
