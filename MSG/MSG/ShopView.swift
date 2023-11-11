//
//  ShopView.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import SwiftUI

struct ShopView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    let data: [String] = [
        "shirt3",
        "shirt4",
        "shirt2",
        "shirt6"
    ]

    let shopData: [String] = [
        "shirt5",
        "shirt1",
        "shoes3",
        "shoes2",
        "shoes1",
        "hat3",
        "hat1",
        "hat2",
        "glasses2",
        "glasses1",
        "headphone",
        "sword1",
        "shield",
        "pickaxe",
        "sword2",
        "boom"
    ]

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(spacing: 16) {
                    Text("Your precious items")
                        .font(.system(size: 22, weight: .bold))
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
                                Text("Your precious items")
                                    .font(.system(size: 22, weight: .bold))
                            )
                        }
                        .padding()

                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(data, id: \.self) { item in
                            Image(item)
                                .resizable()
                                .padding(24)
                                .frame(
                                    width: (geo.size.width - (16 * 2) - 16) / 2,
                                    height: 180
                                )
                                .background(
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
                                        .fill(.white.opacity(0.7))
                                )
                        }
                    }
                    .padding(.horizontal, 16)

                    Text("Looking for more?")
                        .font(.system(size: 22, weight: .bold))
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
                                Text("Looking for more?")
                                    .font(.system(size: 22, weight: .bold))
                            )
                        }
                        .padding()

                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(shopData, id: \.self) { item in
                            VStack {
                                Image(item)
                                    .resizable()
                                    .padding(24)

                                Text("Coin")
                                    .padding(.bottom)
                            }
                            .frame(
                                width: (geo.size.width - (16 * 2) - 16) / 2,
                                height: 220
                            )
                            .background(
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
                                    .fill(.white.opacity(0.7))
                            )
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
        .padding(.bottom, 100)
        .background(
            Image("shopBackground")
                .resizable()
                .ignoresSafeArea(.all)
        )
    }
}

#Preview {
    ShopView()
}
