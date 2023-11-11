//
//  WaterContainer.swift
//  MSG
//
//  Created by Triet Le on 11.11.2023.
//

import ARKit
import SwiftUI
import UIKit

struct WaterContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView()
        let scene = SCNScene()
        arView.scene = scene
        let configuration = ARWorldTrackingConfiguration()
        configuration.worldAlignment = .camera
        arView.session.run(configuration)
        return arView
    }

    func updateUIView(_ uiView: ARSCNView, context: Context) {}
}
