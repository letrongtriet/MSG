//
//  ContentView.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import SwiftUI
import SceneKit
import ARKit
import CoreMotion

struct ContentView: View {
    var scene = SCNScene()
    let motionManager = CMMotionManager()

    var body: some View {
        GeometryReader { geo in
            ARViewContainer()
                .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea(.all)
        .onAppear {
            motionManager.deviceMotionUpdateInterval = 0.025
            motionManager.startDeviceMotionUpdates(to: .main) { data, error in
                if let error {
                    print("Error: \(error.localizedDescription)")
                }

                guard let myData = data else {
                    return
                }

                let gravY = abs(myData.gravity.y)
                let userY = myData.userAcceleration.y

                if gravY > 0.9 {
                    if userY < -1 {
                        print("Squat: \(userY)")
                    } else if userY > 1 {
                        print("Jump: \(userY)")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
