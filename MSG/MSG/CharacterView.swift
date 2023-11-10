//
//  CharacterView.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import SwiftUI
import SceneKit

struct CharacterView: View {
    let scene = SCNScene(named: "SceneKit Asset Catalog.scnassets/pig.scn")
    
    var body: some View {
        SceneView(
            scene: scene,
            options: [
                .autoenablesDefaultLighting,
                .temporalAntialiasingEnabled
            ]
        )
        .frame(width: 100, height: 120)
    }
}

#Preview {
    CharacterView()
}
