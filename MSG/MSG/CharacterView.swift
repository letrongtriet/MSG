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
    
    @State var mpValue: CGFloat = 0
    @State var hpValue: CGFloat = 0
    @State var stamiaValue: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 0) {
            Text("I'm getting stronger! \n Thanks to you, I'm one step closer to becoming the leader Dreamland needs.")
                .font(.system(size: 22, weight: .bold))
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
                        Text("I'm getting stronger! \n Thanks to you, I'm one step closer to becoming the leader Dreamland needs.")
                            .font(.system(size: 22, weight: .bold))
                            .multilineTextAlignment(.center)
                    )
                }
                .padding()
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
                .padding([.vertical, .horizontal])
            
            SceneView(
                scene: scene,
                options: [
                    .allowsCameraControl,
                    .autoenablesDefaultLighting,
                    .temporalAntialiasingEnabled
                ]
            )
            .frame(width: 200, height: 240)
            
            VStack {
                HStack {
                    Text("HP")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(.pink.opacity(0.7).gradient)
                    
                    Spacer()
                }
                
                ProgressView(value: hpValue, total: 100)
                    .tint(.pink.opacity(0.7))
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .animation(.bouncy, value: hpValue)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            hpValue = 64
                        }
                    }
            }
            .padding()
            
            VStack {
                HStack {
                    Text("MP")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(.purple.gradient)
                    
                    Spacer()
                }
                
                ProgressView(value: mpValue, total: 100)
                    .tint(.purple)
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .animation(.bouncy, value: mpValue)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            mpValue = 47
                        }
                    }
            }
            .padding()
            
            VStack {
                HStack {
                    Text("Stamina")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(.yellow.gradient)
                    
                    Spacer()
                }
                
                ProgressView(value: stamiaValue, total: 100)
                    .tint(.yellow)
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .animation(.bouncy, value: stamiaValue)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                            stamiaValue = 89
                        }
                    }
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    CharacterView()
}
