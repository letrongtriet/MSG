//
//  TemplateNode.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import UIKit
import SceneKit

class OrangeNode: SCNNode {
    func loadModal() {
        guard let virtualObject = SCNScene(named: "SceneKit Asset Catalog.scnassets/orange.scn") else {
            return
        }
        let wrappedNode = SCNNode()
        for child in virtualObject.rootNode.childNodes {
            wrappedNode.addChildNode(child)
        }
        addChildNode(wrappedNode)
    }
}
