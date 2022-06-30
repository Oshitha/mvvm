//
//  QoutesScreen.swift
//  Flavor
//
//  Created by Oshitha on 2022-06-30.
//

import SwiftUI

struct QoutesScreen: View {
    
    @StateObject private var viewModel = QoutesViewModelImpl(service: QouteServiceImpl())
    
    var body: some View {
        
        BaseView(content:
                    Group{
            if viewModel.qoutes.isEmpty {
                LoadingView(text: "Fetching")
            }else{
                List{
                    ForEach(viewModel.qoutes,id: \.anime ){ item in
                        
                        QoutesView(item: item)
                        
                    }
                }
            }
            
        }
        ).task {
            await viewModel.getRandomQoutes()
        }
    }
}

struct QoutesScreen_Previews: PreviewProvider {
    static var previews: some View {
        QoutesScreen()
    }
}
