//
//  CommunityView.swift
//  MSG
//
//  Created by Triet Le on 11.11.2023.
//

import SwiftUI

struct CommunityItem: Hashable {
    let name: String
    let color: Color
    let milks: Int
    let fruits: Int
    let monsters: Int
}

struct CommunityView: View {
    let items: [CommunityItem] = [
        .init(name: "Momo", color: .green, milks: Int.random(in: 1...100), fruits: Int.random(in: 1...100), monsters: Int.random(in: 1...100)),
        .init(name: "The dark vader", color: .blue, milks: Int.random(in: 1...100), fruits: Int.random(in: 1...100), monsters: Int.random(in: 1...100)),
        .init(name: "The man who sings", color: .brown, milks: Int.random(in: 1...100), fruits: Int.random(in: 1...100), monsters: Int.random(in: 1...100)),
        .init(name: "The boy who drinks", color: .teal, milks: Int.random(in: 1...100), fruits: Int.random(in: 1...100), monsters: Int.random(in: 1...100)),
        .init(name: "Milk is best", color: .purple, milks: Int.random(in: 1...100), fruits: Int.random(in: 1...100), monsters: Int.random(in: 1...100)),
        .init(name: "Kiwi for mimi", color: .pink, milks: Int.random(in: 1...100), fruits: Int.random(in: 1...100), monsters: Int.random(in: 1...100))
    ]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Text("See how other guardians are doing or invite friends to join the fun!")
                        .font(.system(size: 22, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.mint.gradient)
                        .padding()

                    ForEach(items, id: \.self) { item in
                        VStack {
                            HStack {
                                VStack(spacing: 24) {
                                    Text(item.name)
                                        .font(.system(size: 22, weight: .bold))
                                        .foregroundStyle(item.color.gradient)

                                    HStack(spacing: 16) {
                                        Text("Milk\n \(item.milks)")
                                            .font(.system(size: 22, weight: .bold))
                                            .multilineTextAlignment(.center)
                                            .foregroundStyle(.pink.opacity(0.7).gradient)

                                        Text("Fruits\n \(item.fruits)")
                                            .font(.system(size: 22, weight: .bold))
                                            .multilineTextAlignment(.center)
                                            .foregroundStyle(.purple.gradient)

                                        Text("Monsters\n \(item.monsters)")
                                            .font(.system(size: 22, weight: .bold))
                                            .multilineTextAlignment(.center)
                                            .foregroundStyle(.yellow.gradient)
                                    }

                                    Button {

                                    } label: {
                                        HStack {
                                            Spacer()
                                            Text("Challenge!")
                                                .font(.system(size: 16, weight: .bold))
                                                .foregroundStyle(item.color.gradient)
                                                .padding(8)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .stroke(item.color.gradient, lineWidth: 2)
                                                )
                                        }
                                    }
                                    .buttonStyle(.plain)
                                }
                                Spacer()
                            }
                            .padding([.horizontal, .vertical])
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.white.opacity(0.85))
                        )
                        .padding(.horizontal, 16)
                        .padding(.bottom, 12)
                    }
                }
            }// scroll view
        }
        .padding(.bottom, 100)
        .background(
            Image("communityBackground")
                .resizable()
                .ignoresSafeArea(.all)
        )
    }
}

#Preview {
    CommunityView()
}
