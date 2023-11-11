//
//  ChooseYourCharacterView.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import SwiftUI
import SceneKit

struct CharacterItem: Identifiable {
    let id = UUID()
    let name: String
    let scene: SCNScene?
}

struct ChooseYourCharacterView: View {
    let items: [CharacterItem] = [
        .init(name: "Momo", scene: SCNScene(named: "SceneKit Asset Catalog.scnassets/chicken.scn")),
        .init(name: "Bobo", scene: SCNScene(named: "SceneKit Asset Catalog.scnassets/cow.scn")),
        .init(name: "Pipi", scene: SCNScene(named: "SceneKit Asset Catalog.scnassets/bear.scn"))
    ]

    @State var showSafetyVideo: Bool = false
    @AppStorage("onboarded") var onboarded: Bool = false

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 16) {
                Spacer()
                Text("Each creature has unique powers hidden within. Choose your companion and name it to start our journey!")
                    .font(.system(size: 25, weight: .bold))
                    .multilineTextAlignment(.center)
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
                            Text("Each creature has unique powers hidden within. Choose your companion and name it to start our journey!")
                                .font(.system(size: 25, weight: .bold))
                                .multilineTextAlignment(.center)
                        )
                    }
                    .padding(.horizontal, 16)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(items) { char in
                            Button {
                                showSafetyVideo = true

                                DispatchQueue.main.asyncAfter(deadline: .now() + 28) {
                                    onboarded = true
                                }
                            } label: {
                                VStack {
                                    Text(char.name)
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundStyle(.mint.gradient)

                                    SceneView(
                                        scene: char.scene,
                                        options: [
                                            .autoenablesDefaultLighting
                                        ]
                                    )
                                    .containerRelativeFrame(.horizontal, count: 1, spacing: 16)
                                    .scrollTransition { content, phase in
                                        content
                                            .opacity(phase.isIdentity ? 1 : 0.5)
                                            .scaleEffect(
                                                x: phase.isIdentity ? 1 : 0.5,
                                                y: phase.isIdentity ? 1 : 0.5
                                            )
                                            .offset(y: phase.isIdentity ? 0 : 50)
                                    }
                                }
                            }
                            .buttonStyle(.plain)
                        }
                        Spacer()
                    }
                    .scrollTargetLayout()
                }// scrollview
                .contentMargins(16)
                .scrollTargetBehavior(.viewAligned)

                Spacer()
            }
            .onAppear {
                items[2].scene?.rootNode.eulerAngles = .init(x: 0, y: Float.pi / 2, z: 0)
            }
        }// geometry
        .background(.white)
        .fullScreenCover(isPresented: $showSafetyVideo) {
            EducationVideoView(fileName: "safety")
        }
    }// body
}

#Preview {
    ChooseYourCharacterView()
}
