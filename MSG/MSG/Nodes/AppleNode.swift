//
//  TemplateNode.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import UIKit
import SceneKit

class AppleNode: SCNNode {
    func loadModal() {
        guard let virtualObject = SCNScene(named: "SceneKit Asset Catalog.scnassets/apple.scn") else {
            return
        }
        let wrappedNode = SCNNode()
        for child in virtualObject.rootNode.childNodes {
            child.eulerAngles = .init(x: 0, y: 0, z: Float.pi / 2)
            wrappedNode.addChildNode(child)
        }
        addChildNode(wrappedNode)
    }
}
