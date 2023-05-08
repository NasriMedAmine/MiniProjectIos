//
//  TestCodeQr.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 7/5/2023.
//

import SwiftUI

import CoreImage.CIFilterBuiltins


struct TestCodeQr: View {
    
    let nameUser : String
    let emailUser : String
    let TelUser : Int
    
    
    @State private var name = "Anonymous"
    @State private var emailAddress = "you@yoursite.com"
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    
    var body: some View {
        NavigationView {
            Form {
                
                
                Image(uiImage: generateQRCode(from: "\(nameUser)\n\(emailUser)\n\(TelUser)"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: .infinity, height: .infinity)
            }
            .navigationTitle("Your code")
        }
    }
    
    
    
    
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    
    
    
}



struct TestCodeQr_Previews: PreviewProvider {
    static var previews: some View {
        TestCodeQr(nameUser: "yassine", emailUser: "yassine@test.tn", TelUser: 00000)
    }
}
