//
//  MilkContainer.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import ARKit
import SwiftUI
import UIKit

struct MilkContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView()
        let scene = SCNScene()
        arView.scene = scene
        let configuration = ARWorldTrackingConfiguration()
        configuration.worldAlignment = .camera
        arView.session.run(configuration)
        let milk = MilkNode()
        milk.loadModal()
        milk.position = SCNVector3(
            x: 0,
            y: 0,
            z: -8
        )
        arView.scene.rootNode.addChildNode(milk)
        return arView
    }

    func updateUIView(_ uiView: ARSCNView, context: Context) {}
}
