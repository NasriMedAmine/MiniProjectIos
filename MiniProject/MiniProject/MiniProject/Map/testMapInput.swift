//
//  testMapInput.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 7/5/2023.
//

import SwiftUI

struct testMapInput: View {
    @State private var tapCount = 0
    @State private var lastTapLocation = CGPoint.zero

    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .overlay(
                    Text("Tap anywhere!")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                )
                .onTapGesture(count: 2) {
                    tapCount += 1
                    lastTapLocation = CGPoint(x: geometry.frame(in: .global).midX,
                                              y: geometry.frame(in: .global).midY)
                    print("Tap \(tapCount) captured at location: \(lastTapLocation)")
                }
        }
    }
}

struct testMapInput_Previews: PreviewProvider {
    static var previews: some View {
        testMapInput()
    }
}
