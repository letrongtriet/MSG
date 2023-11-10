//
//  ARView.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import ARKit
import SwiftUI
import UIKit

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView()
        let scene = SCNScene()
        arView.scene = scene

        let configuration = ARWorldTrackingConfiguration()
        configuration.worldAlignment = .gravityAndHeading

        arView.session.run(configuration)
        
        /*
        let chick = ChickNode()
        chick.loadModal()
        chick.position = SCNVector3(
            x: randomPosition(upperBound: 1.5, lowerBound: -1.5),
            y: randomPosition(upperBound: 1.5, lowerBound: -1.5),
            z: -1
        )

        arView.scene.rootNode.addChildNode(chick)
        */
        
        return arView
    }
    
    func randomPosition(upperBound: Float, lowerBound: Float) -> Float {
        Float(arc4random()) / Float(UInt32.max) * (lowerBound - upperBound) + upperBound
    }

    func updateUIView(_ uiView: ARSCNView, context: Context) {}
}
