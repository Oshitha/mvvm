//
//  QoutesView.swift
//  Flavor
//
//  Created by Oshitha on 2022-06-30.
//

import SwiftUI

struct QoutesView: View {
    
    let item: Quote
    
    var body: some View {
        Text(item.anime)
    }
}

struct QoutesView_Previews: PreviewProvider {
    static var previews: some View {
        QoutesView(item: Quote(anime: "1", character: "1", quote: "1"))
    }
}
