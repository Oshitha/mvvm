//
//  BaseView.swift
//  Flavor
//
//  Created by Oshitha on 2022-06-30.
//

import Foundation
import SwiftUI

struct BaseView<Content>: View where Content: View {
    let content: Content

    var body : some View {
        ZStack(alignment: .center) {
            Color.blue
            content
        }
        .ignoresSafeArea()
        .accentColor(Color.gray)
    }
}
