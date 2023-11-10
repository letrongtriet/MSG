//
//  TemplateNode.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import UIKit
import SceneKit

class CowNode: SCNNode {
    func loadModal() {
        guard let virtualObject = SCNScene(named: "SceneKit Asset Catalog.scnassets/cow.scn") else {
            return
        }
        let wrappedNode = SCNNode()
        for child in virtualObject.rootNode.childNodes {
            wrappedNode.addChildNode(child)
        }
        addChildNode(wrappedNode)
    }
}
