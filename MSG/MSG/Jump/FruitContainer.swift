//
//  FruitContainer.swift
//  MSG
//
//  Created by Triet Le on 11.11.2023.
//

import ARKit
import SwiftUI
import UIKit

struct FruitContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView()
        let scene = SCNScene()
        arView.scene = scene
        let configuration = ARWorldTrackingConfiguration()
        configuration.worldAlignment = .camera
        arView.session.run(configuration)
        let milk = AppleNode()
        milk.loadModal()
        milk.position = SCNVector3(
            x: -10,
            y: 0,
            z: -30
        )
        arView.scene.rootNode.addChildNode(milk)
        return arView
    }

    func updateUIView(_ uiView: ARSCNView, context: Context) {}
}

