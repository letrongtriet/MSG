//
//  ChooseYourCharacterView.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import SwiftUI
import SceneKit

struct ChooseYourCharacterView: View {
    let characterOne = SCNScene(named: "SceneKit Asset Catalog.scnassets/chicken.scn")
    let characterTwo = SCNScene(named: "SceneKit Asset Catalog.scnassets/cow.scn")
    let characterThree = SCNScene(named: "SceneKit Asset Catalog.scnassets/bear.scn")
    
    @State var shouldShowNameInput: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(spacing: 16) {
                    Text("Choose your pet")
                        .font(.system(size: 30, weight: .bold))
                        .overlay {
                            LinearGradient(
                                colors: [
                                    .pink.opacity(0.7),
                                    .purple,
                                    .yellow
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            .mask(
                                Text("Choose your pet")
                                    .font(.system(size: 30, weight: .bold))
                            )
                        }
                    
                    ForEach([characterOne, characterTwo, characterThree], id: \.self) { char in
                        Button {
                            
                        } label: {
                            HStack(spacing: 0) {
                                Spacer()
                                SceneView(
                                    scene: char,
                                    options: [
                                        .autoenablesDefaultLighting,
                                        .temporalAntialiasingEnabled
                                    ]
                                )
                                .frame(
                                    width: geo.size.width - 48,
                                    height: (geo.size.height - 150) / 2
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(
                                            LinearGradient(
                                                colors: [
                                                    .pink.opacity(0.7),
                                                    .purple,
                                                    .yellow
                                                ],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                            lineWidth: 4
                                        )
                                )
                                Spacer()
                            }
                        }
                    }
                    Spacer()
                }
            }// scrollview
            .onAppear {
                characterThree?.rootNode.rotate(
                    by: SCNVector4(x: 0.0, y: 1, z: 0, w: 0),
                    aroundTarget: SCNVector3()
                )
            }
        }// geometry
    }// body
}

#Preview {
    ChooseYourCharacterView()
}
