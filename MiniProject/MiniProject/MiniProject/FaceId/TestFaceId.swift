//
//  TestFaceId.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 7/5/2023.
//

import SwiftUI
import LocalAuthentication




struct TestFaceId: View {
    
    
    
    @State private var isUnlocked = false

    
    
    
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Locked")
            } else {
                Text("Unlocked")
            }
        }
        .onAppear{
            authenticate()
            
            
        }
    }
    
    
    
    
    
    
    
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    isUnlocked = true
                    
                    print("---------------------------------------------------------")
                    print("---------------------------------------------------------")
                    print("faceID working success")
                    
                    
                    print(success)

                    print("---------------------------------------------------------")
                    print("---------------------------------------------------------")
                    print("faceID working success")

                } else {
                    
                    print("---------------------------------------------------------")
                    print("---------------------------------------------------------")
                    print("faceID working success else")

                }
            }
        } else {
            print("---------------------------------------------------------")
            print("---------------------------------------------------------")
            print("faceID working  no biometrics")

            // no biometrics
        }
    }
    
    
    
    
}

struct TestFaceId_Previews: PreviewProvider {
    static var previews: some View {
        TestFaceId()
    }
}
