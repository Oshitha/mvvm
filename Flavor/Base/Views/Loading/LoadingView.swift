//
//  LoadingView.swift
//  Flavor
//
//  Created by Oshitha on 2022-06-30.
//

import SwiftUI

struct LoadingView: View {
    
    let text: String
    
    var body: some View {
        VStack{
            ProgressView()
            Text(text)
        }
        
       
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(text: "Fetching")
    }
}
