//
//  Test.swift
//  SwiftUI2
//
//  Created by Mac Mini 10 on 30/3/2023.
//

import SwiftUI

struct Test: View {
    var body: some View {
        NavigationView {
                    VStack {
                        Text("Welcome to my app!")
                        NavigationLink(destination: ListDonations()) {
                            Text("Go to second view")
                        }
                    }
                    .navigationTitle("My App")
                }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
