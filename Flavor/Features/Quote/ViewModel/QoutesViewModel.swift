//
//  File.swift
//  Flavor
//
//  Created by Oshitha on 2022-06-30.
//

import Foundation


protocol QoutesViewModel :ObservableObject{
    func getRandomQoutes() async
}

@MainActor
final class QoutesViewModelImpl : QoutesViewModel{
    
    @Published private(set) var qoutes:[Quote] = []
    
    private var qouteService:QouteService
    
    init(service:QouteService){
        self.qouteService = service
    }
    
    func getRandomQoutes() async {
        do{
            self.qoutes = try await qouteService.fetchRandomQoutes()
        }catch{
            print(error)
        }
    }
}
