//
//  ChallengeListView.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import SwiftUI

struct ChallengeItem: Identifiable {
    let id = UUID()
    let name: String
    let isLocked: Bool
}

struct ChallengeListView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    let data: [ChallengeItem] = [
        .init(name: "Milky Way Squats", isLocked: false),
        .init(name: "Fruit Jump Fiesta", isLocked: false),
        .init(name: "Boxing Bonanza", isLocked: false),
        .init(name: "Dark Invasion", isLocked: true),
        .init(name: "Time traveller", isLocked: true),
        .init(name: "Help Jog", isLocked: true),
        .init(name: "Coming home", isLocked: true),
        .init(name: "The one who got away", isLocked: true)
    ]

    @State var showSquat: Bool = false
    @State var showJump: Bool = false
    @State var showBoxing: Bool = false

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 16) {
                Text("Let's the adventure begin by choosing your challenge!")
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
                            Text("Let's the adventure begin by choosing your challenge!")
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

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(data) { item in
                            Button {
                                startGame(with: item.name)
                            } label: {
                                Text(item.name)
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.center)
                                    .frame(
                                        width: (geo.size.width - (16 * 2) - 16) / 2,
                                        height: 240
                                    )
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(
                                                LinearGradient(
                                                    colors: [
                                                        .pink.opacity(0.7),
                                                        .purple,
                                                        .yellow
                                                    ],
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                    )
                            }
                            .buttonStyle(.plain)
                            .disabled(item.isLocked)
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
        .padding(.bottom, 100)
        .background(
            Image("background")
                .resizable()
                .ignoresSafeArea(.all)
        )
        .fullScreenCover(isPresented: $showSquat) {
            SquatView()
        }
        .fullScreenCover(isPresented: $showJump) {
            JumpView()
        }
        .fullScreenCover(isPresented: $showBoxing) {
            BoxingView()
        }
    }

    private func startGame(with item: String) {
        switch item {
        case "Milky Way Squats":
            showSquat = true
        case "Fruit Jump Fiesta":
            showJump = true
        case "Boxing Bonanza":
            showBoxing = true
        default:
            return
        }
    }
}

#Preview {
    ChallengeListView()
}
