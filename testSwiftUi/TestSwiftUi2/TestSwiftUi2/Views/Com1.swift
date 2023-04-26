//
//  Com1.swift
//  TestSwiftUi2
//
//  Created by Mac Mini 10 on 28/3/2023.
//

import SwiftUI

struct Com1: View {
    var body: some View {
        Image("login_photo 1")
            .clipShape(Circle())
            .overlay(content: {
                Circle().stroke(.gray , lineWidth: 4)
            })
            .shadow(radius : 7)
    }
}

struct Com1_Previews: PreviewProvider {
    static var previews: some View {
        Com1()
    }
}
