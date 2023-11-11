//
//  HomeView.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import SwiftUI

struct HomeView: View {
    let link = URL(string: "https://github.com/letrongtriet/MSG")!

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomTrailing) {
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            Text("Let's see what did you achieve!")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundStyle(.mint.gradient)
                        }
                        .padding()

                        HStack(spacing: 16) {
                            Text("Milk\n 64")
                                .font(.system(size: 22, weight: .bold))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.pink.opacity(0.7).gradient)
                                )

                            Text("Fruits\n 47")
                                .font(.system(size: 22, weight: .bold))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.purple.gradient)
                                )

                            Text("Monsters\n 89")
                                .font(.system(size: 22, weight: .bold))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.yellow.gradient)
                                )
                        }
                        .padding()

                        CharacterView()
                    }
                }
                
                ShareLink(item: link, message: Text("Learn Swift here!")) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title.weight(.semibold))
                        .padding()
                        .background(
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
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                .padding()
            }
        }
        .padding(.bottom, 100)
        .background(.white)
    }
}

#Preview {
    HomeView()
}
