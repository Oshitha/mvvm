//
//  File.swift
//  Flavor
//
//  Created by Oshitha on 2022-06-30.
//

import Foundation
import Combine


protocol QoutesViewModel :ObservableObject{
    func getRandomQoutes() async
    func getQuotesList()
}

    //@MainActor
final class QoutesViewModelImpl : QoutesViewModel{
    
    //@Published private(set) var qoutes:[Quote] = []
    @Published private(set) var qoutes:[QuotesResponseElementElement] = []
    
    var cancellables = Set<AnyCancellable>()
    
    private var qouteService:QouteService
    
    init(service:QouteService){
        self.qouteService = service
    }
    
    func getRandomQoutes() async {
        do{
            //self.qoutes = try await qouteService.fetchRandomQoutes()
        }catch{
            print(error)
        }
    }
    
    func getQuotesList() {
        let cancellable =  qouteService.getQuoteList(endPoint: .getQuotesList)
            .sink { result in
                
                switch result{
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    print("FINISH9")
                }
            } receiveValue: { quote in
                print("quote",quote)
                self.qoutes = quote
            }
        cancellables.insert(cancellable)
    }
}
